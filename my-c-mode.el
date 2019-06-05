(require 'cc-mode)
(require 'cmacexp)
(require 'my-elisp)

;; ----- ;;
;; Style ;;
;; ----- ;;

(defun c-lineup-C-comments-boxes (arg)
  (let ((box (save-excursion
               (goto-char (cdr arg))
               (looking-at "/\\*-*\\.$"))))
    (if box
        0
      (c-lineup-C-comments arg))))

(c-add-style "epita"
             '((c-basic-offset . 2)
               (c-comment-only-line-offset . 0)
               (c-hanging-braces-alist     . ((substatement-open before after)))
               (c-offsets-alist . ((topmost-intro        . 0)
                                   (substatement         . +)
                                   (substatement-open    . 0)
                                   (case-label           . +)
                                   (access-label         . -)
                                   (inclass              . +)
                                   (inline-open          . 0)
                                   (c                    . c-lineup-C-comments-boxes)))))
(setq c-default-style '((c++-mode ."epita")))


;; ------------ ;;
;; Preprocessor ;;
;; ------------ ;;

(defun c-preproc-indent-level (pos)
	"Return the indentention level of preprocessor directives for current line"
	(interactive "d")
	(save-excursion
		(beginning-of-buffer)
		(let ((res 0))
			(while (< (point) pos)
				(when (looking-at "#\\s-*if")
					(setq res (+ res 1)))
				(when (looking-at "#\\s-*endif")
					(setq res (- res 1)))
				(forward-line))
			res
			)))

;; ------------ ;;
;; Include path ;;
;; ------------ ;;

(defvar c-include-path
	()
	"List of path to search for includes")

(defun c-add-include-path (path)
	(interactive "DDirectory: \n")
	(add-to-list 'c-include-path path)
	(set 'c-macro-cppflags (concat c-macro-cppflags " -I'" path "'")))

(defun c-make-include (path paths)
	(if paths
			(let ((rg (concat "^" (car paths) "/")))
				(if (string-match rg path)
						(concat "<" (replace-regexp-in-string rg "" path) ">")
					(c-make-include path (cdr paths))))
		(let ((file (current-file-name)))
			(concat "\""
							(if file
									(remove-prefix-from-string (file-name-directory file) path)
								path)
							"\""))))

;; -------------- ;;
;; Code templates ;;
;; -------------- ;;

;; Helpers

(defun c-fresh-line ()
	(beginning-of-line)
	(when (not (looking-at "\\W*$"))
		(insert "\n")
		(line-move -1)))

;; Preprocessor: Helpers

(defun c-open-preproc ()
	(c-fresh-line)
	(insert "#")
	(insert (make-string (c-preproc-indent-level (point)) ? )))

;; Preprocessor: Include

(defun c-insert-include (std)
	(interactive "P")
	(if std
      (call-interactively 'c-insert-standard-include)
		(call-interactively 'c-insert-local-include)))

(defun c-insert-local-include (name)
	(interactive "fInclude: \n")
	(save-excursion
		(c-open-preproc)
		(insert "include ")
		(insert (c-make-include name c-include-path))))

(defun c-insert-standard-include (name)
	(interactive "sInclude: \n")
	(save-excursion
		(c-open-preproc)
		(insert "include <")
		(insert name)
		(insert ">")))

;; Debug output

(defun c-insert-debug (&optional msg)
  (interactive)
  (when (not (looking-at "\\W*$"))
    (beginning-of-line)
    (insert "\n")
    (line-move -1))
  (c-indent-line)
  (insert "std::cerr << \"\" << std::endl;")
  (backward-char 15))

;; Blocks

(defun c-insert-block (&optional r b a)
  (interactive "P")
  (unless b (setq b ""))
  (unless a (setq a ""))
  (if r
      (progn
        (save-excursion
          (goto-char (rbegin))
          (beginning-of-line)
          (insert "\n")
          (line-move -1)
          (insert b "{")
          (c-indent-line))
        (save-excursion
          (goto-char (- (rend) 1))
          (end-of-line)
          (insert "\n}" a)
          (c-indent-line)
          (line-move -1)
          (end-of-line))
        (indent-region (rbegin) (rend)))
    (progn
        (beginning-of-line)

        (setq begin (point))

        (insert b "{\n")
        (end-of-line)
        (insert "\n}" a)

        (indent-region begin (point))

        (line-move -1)
        (end-of-line))))

(defun c-insert-braces (&optional r)
  (interactive "P")
  (c-insert-block r))

(defun c-insert-ns (name r)
  (interactive "sName: \nP")
  (c-insert-block r (concat "namespace " name "\n")))

(defun c-insert-switch (value r)
  (interactive "sValue: \nP")
  (c-insert-block r (concat "switch (" value ")\n")))

(defun c-insert-if (c r)
  (interactive "sCondition: \nP")
  (c-insert-block r (concat "if (" c ")\n")))

(defun c-insert-class (name)
  (interactive "sName: ")
  (c-insert-block () (concat "class " name "\n") ";")
  (insert "public:")
  (c-indent-line)
  (insert "\n")
  (c-indent-line))

;; -------------------- ;;
;; Automatic insertions ;;
;; -------------------- ;;

(defun c-hook-insert-header-inclusion ()
  (interactive)
  (when (and (memq major-mode '(c-mode c++-mode)) (equal (point-min) (point-max)) (string-match ".*\\.cc?" (buffer-file-name)))
    (let ((name (replace-regexp-in-string ".c$" ".h"
            (replace-regexp-in-string ".cc$" ".hh" (buffer-file-name)))))
      (message "in there: %s" name)
      (c-insert-local-include name))))

(add-hook 'find-file-hooks (function c-hook-insert-header-inclusion))

(defun insert-header-guard ()
  (interactive)
  (save-excursion
    (when (buffer-file-name)
        (let*
            ((name (file-name-nondirectory buffer-file-name))
             (macro (replace-regexp-in-string
                     "\\." "_"
                     (replace-regexp-in-string
                      "-" "_"
                      (upcase name)))))
          (goto-char (point-min))
         (insert "#ifndef " macro "\n")
          (insert "# define " macro "\n\n")
          (goto-char (point-max))
          (insert "\n#endif\n")))))

(defun insert-pragma-once ()
  (interactive)
  (save-excursion
    (when (buffer-file-name)
        (let
            ((name (file-name-nondirectory buffer-file-name)))
          (goto-char (point-min))
          (insert "#pragma once\n\n")))))

;; (add-hook 'find-file-hooks
;; 	  (lambda ()
;; 	    (when (and (memq major-mode '(c-mode c++-mode)) (equal (point-min) (point-max)) (string-match ".*\\.hh?" (buffer-file-name)))
;; 	      (insert-header-guard)
;; 	      (goto-line 3)
;; 	      (insert "\n"))))

(add-hook 'find-file-hooks
	  (lambda ()
	    (when (and (memq major-mode '(c-mode c++-mode)) (equal (point-min) (point-max)) (string-match ".*\\.hh?" (buffer-file-name)))
	      (insert-pragma-once)
              (goto-char (point-max)))))

;; ------- ;;
;; Sandbox ;;
;; ------- ;;

;;;###autoload
(defun sandbox ()
  "Opens a C++ sandbox in current window."
  (interactive)
  (cd "/tmp")
  (let ((file (make-temp-file "/tmp/" nil ".cc")))
    (find-file-literally file)
    (c++-mode)
    (insert "int main()\n{\n\n}\n")
    (line-move -2)
    (save-buffer)
    (compile (concat "g++ -W -Wall -std=c++11 " file " && ./a.out"))))

;; ------------- ;;
;; Configuration ;;
;; ------------- ;;

;;;###autoload
(defun c++-mode-setup ()
  ;; Rebox with C-style comments
  (set 'my-rebox-style 223)
  ;; Show 80 column marker
  (set-variable 'fill-column 80)
  (fci-mode))

;; --- ;;
;; GDB ;;
;; --- ;;

(defvar my-gdb-program "")
(defvar my-gdb-args '())

(defun my-gdb-find-program (path)
	(interactive "f")
	(setq my-gdb-program path))

(defun my-gdb ()
	(interactive)
	(window-configuration-to-register :c)
	(when (string-equal my-gdb-program "")
		(call-interactively (function my-gdb-find-program)))
	(set 'my-gdb-status t)
	(gdb (concat "gdb -i=mi --args " my-gdb-program (apply (function concat) (mapcar (lambda (x) (format " %s" x)) my-gdb-args))))
	(gud-call "set confirm off"))

(defconst my-gdb-status nil)

(defun my-gdb-switch ()
	(interactive)
	(if my-gdb-status
			(progn
				(message "Close debugger view")
				(window-configuration-to-register :d)
				(set 'my-gdb-status nil)
				(jump-to-register :c))
		(progn
			(message "Open debugger view")
			(window-configuration-to-register :c)
			(set 'my-gdb-status t)
			(jump-to-register :d))
		)
	)

(defun my-gdb-run ()
	(interactive)
	(gud-call "run"))

(defun my-gdb-stop ()
	(interactive)
	(gud-stop-subjob))

(defun my-gdb-kill ()
	(interactive)
	(my-gdb-stop)
	(gud-call "kill"))

(defun c-window-layout ()
	(interactive)
	(window-set-width 80))

(require 'my-helpers)
(defun c-switch-hh-cc ()
  (interactive)
  (find-next-file '("hh" "hxx" "cc")))

;; -------- ;;
;; Bindings ;;
;; -------- ;;

(define-key c-mode-base-map [(control c) (w)] 'c-switch-hh-cc)
(define-key c-mode-base-map [(control c) (f)] 'hs-hide-block)
(define-key c-mode-base-map [(control c) (s)] 'hs-show-block)
(define-key c-mode-base-map [(control c) (control n)] 'c-insert-ns)
(define-key c-mode-base-map [(control c) (control b)] 'c-insert-braces)
(define-key c-mode-base-map [(control c) (control f)] 'insert-fixme)
(define-key c-mode-base-map [(control c) (control d)] 'c-insert-debug)
(define-key c-mode-base-map [(control c) (control l)] 'c-insert-class)

;;   ;; Lay window out
;;   (define-key
;;     c-mode-base-map
;;     [(meta l)]
;;     'c-window-layout)

;; Insert inclusion
;; (define-key
;;	c-mode-base-map
;;	[(control c) (control i)]
;;	'c-insert-include)

;; Rebox comment
(define-key
	c-mode-base-map
	[(meta q)]
	'my-rebox-comment)

;; Switch debugger
(global-set-key
 [(control c) (d)]
 'my-gdb-switch)

;; Show debugger
(define-key
	c-mode-base-map
	[(control c) (g)]
	'my-gdb)

;; Run program
(define-key
	c-mode-base-map
	[(control c) (r)]
	'my-gdb-run)

;; Stop program
(define-key
	c-mode-base-map
	[(control c) (s)]
	'my-gdb-stop)

;; Kill program
(define-key
	c-mode-base-map
	[(control c) (k)]
	'my-gdb-kill)

;; HS mode

(define-key
	c-mode-base-map
	[(control c) (left)]
	'hs-hide-block)

(define-key
	c-mode-base-map
	[(control c) (up)]
	'hs-hide-level)

(define-key
	c-mode-base-map
	[(control c) (right)]
  'hs-show-block)

(define-key
	c-mode-base-map
	[(control c) (down)]
	'hs-show-all)

(define-key c-mode-base-map (kbd "M-.") (function rtags-find-symbol-at-point))
(define-key c-mode-base-map (kbd "M-,") (function rtags-find-references-at-point))

;; C++ 11

(font-lock-add-keywords
 'c++-mode
 '(("alignof" . font-lock-keyword-face)
   ("alignas" . font-lock-keyword-face)
   ("constexpr" . font-lock-keyword-face)
   ("decltype" . font-lock-keyword-face)
   ("noexcept" . font-lock-keyword-face)
   ("nullptr" . font-lock-keyword-face)
   ("static_assert" . font-lock-keyword-face)
   ("thread_local" . font-lock-keyword-face)
   ("override" . font-lock-keyword-face)
   ("final" . font-lock-keyword-face)))

(provide 'my-c-mode)
