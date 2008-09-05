;;
;; emacs configuration
;;
;; Made by mefyl <mefyl@lrde.epita.fr>
;;
;; Based on Nicolas Despres <despre_n@lrde.epita.fr> configuration
;; Thanks go to Micha <micha@lrde.epita.fr> for his help
;;

(defun may-load (path)
  "Load a file iff it exists."
  (when (file-readable-p path)
    (load-file path)))

;; Load local distribution configuration file
(may-load "~/.emacs.site")

(defconst conf-dir "/home/mefyl/.emacs.conf/"
  "Location of the configuration files")
(add-to-list 'load-path conf-dir)

(require 'my-autoload)
(require 'my-c-mode)
(require 'my-elisp)
(require 'my-lisp-mode)

(defconst has-gnuserv
  (fboundp 'gnuserv-start)
  "Whether gnuserv is available")

;; Version detection

(defconst xemacs (string-match "XEmacs" emacs-version)
  "non-nil iff XEmacs, nil otherwise")

(defconst emacs22 (string-match "^22." emacs-version)
  "non-nil iff Emacs 22, nil otherwise")

;; CUSTOM FUNCTIONS

;; Reload conf

(defun reload ()
  (interactive)
  (load-file "~/.emacs"))

;; Compilation

(setq compile-command "")

(defun build ()
  (interactive)
  (if (string-equal compile-command "")
    (progn
      (while (not (or (file-readable-p "Makefile") (file-readable-p "Drakefile") (string-equal (cwd) "/")))
        (cd ".."))
      (if (string-equal (cwd) "/")
        (message "No Makefile or Drakefile found.")
          (if (file-readable-p "Makefile")
            (compile (concat "cd " (cwd) " && make"))
            (compile (concat "cd " (cwd) " && drake")))))
    (recompile)))

;; Edition

(defun c-switch-hh-cc ()
  (interactive)
  (let ((other
         (let ((file (buffer-file-name)))
           (if (string-match "\\.hh$" file)
               (replace-regexp-in-string "\\.hh$" ".cc" file)
             (replace-regexp-in-string "\\.cc$" ".hh" file)))))
    (find-file other)))

(defun count-word (start end)
  (let ((begin (min start end))(end (max start end)))
    (save-excursion
      (goto-char begin)
      (re-search-forward "\\W*") ; skip blank
      (setq i 0)
      (while (< (point) end)
        (re-search-forward "\\w+")
        (when (<= (point) end)
          (setq i (+ 1 i)))
        (re-search-forward "\\W*"))))
  i)

(defun stat-region (start end)
  (interactive "r")
  (let
      ((words (count-word start end)) (lines (count-lines start end)))
    (message
     (concat "Lines: "
             (int-to-string lines)
             "  Words: "
             (int-to-string words)))
    )
  )

(defun ruby-command (cmd &optional output-buffer error-buffer)
  "Like shell-command, but using ruby."
  (interactive (list (read-from-minibuffer "Ruby command: "
					   nil nil nil 'ruby-command-history)
		     current-prefix-arg
		     shell-command-default-error-buffer))
  (shell-command (concat "ruby -e '" cmd "'") output-buffer error-buffer))

;; Shebangs

(defun insert-shebang (bin)
  (interactive "sBin: ")
  (save-excursion
    (goto-char (point-min))
    (insert "#!" bin "\n\n")))

(defun insert-shebang-if-empty (bin)
  (when (buffer-empty-p)
    (insert-shebang bin)))

;; C/C++

;; Comment boxing

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

(defun insert-header-inclusion ()
  (interactive)
  (when (buffer-file-name)
    (let
        ((name
          (replace-regexp-in-string ".c$" ".h"
            (replace-regexp-in-string ".cc$" ".hh"
              (file-name-nondirectory buffer-file-name)))))
      (insert "#include \"" name "\"\n\n"))))


(defun sandbox ()
  "Opens a C++ sandbox in current window."
  (interactive)
  (cd "/tmp")
  (let ((file (make-temp-file "/tmp/" nil ".cc")))
    (find-file file)
    (insert "int main()\n{\n\n}\n")
    (line-move -2)
    (save-buffer)
    (compile (concat "g++ -W -Wall -I /usr/include/qt4/ -I /usr/include/qt4/QtCore/ -L /usr/lib/qt4 -lQtCore " file " && ./a.out"))))

;; Generic FIXME insertion method. Works as long as the mode has a
;; comment-region function.
(defun insert-fixme (&optional msg)
  (interactive "sFixme: ")
  (save-excursion
    (end-of-line)
    (when (not (looking-back "^\\s *"))
      (insert " "))
    (setq start (point))
    (insert "FIXME")
    (when (not (string-equal msg ""))
      (insert ": " msg))
  (comment-region start (point))))

(defun c-insert-debug (&optional msg)
  (interactive)
  (when (not (looking-at "\\W*$"))
    (beginning-of-line)
    (insert "\n")
    (line-move -1))
  (c-indent-line)
  (insert "std::cerr << \"\" << std::endl;")
  (backward-char 15))

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


;; OPTIONS

(setq inhibit-startup-message t)        ; don't show the GNU splash screen
(setq frame-title-format "%b")          ; titlebar shows buffer's name
(global-font-lock-mode t)               ; syntax highlighting
(setq font-lock-maximum-decoration t)   ; max decoration for all modes
;(setq transient-mark-mode 't)          ; highlight selection
(setq line-number-mode 't)              ; line number
(setq column-number-mode 't)            ; column number
(when (display-graphic-p)
  (progn
    (scroll-bar-mode -1)                ; no scroll bar
    (menu-bar-mode -1)                  ; no menu bar
    (tool-bar-mode -1)                  ; no tool bar
    (mouse-wheel-mode t)))              ; enable mouse wheel


(setq delete-auto-save-files t)         ; delete unnecessary autosave files
(setq delete-old-versions t)            ; delete oldversion file
(setq normal-erase-is-backspace-mode t) ; make delete work as it should
(fset 'yes-or-no-p 'y-or-n-p)           ; 'y or n' instead of 'yes or no'
(setq default-major-mode 'text-mode)    ; change default major mode to text
(setq ring-bell-function 'ignore)       ; turn the alarm totally off
(setq make-backup-files nil)            ; no backupfile

;; FIXME: wanted 99.9% of the time, but can cause your death 0.1% of
;; the time =). Todo: save buffer before reverting
;(global-auto-revert-mode t)            ; auto revert modified files

;(pc-selection-mode)                    ; selection with shift
(auto-image-file-mode)                  ; to see picture in emacs
;(dynamic-completion-mode)              ; dynamic completion
(show-paren-mode t)			; match parenthesis
(setq-default indent-tabs-mode nil)	; don't use fucking tabs to indent

;; HOOKS

; Delete trailing whitespaces on save
(add-hook 'write-file-hooks 'delete-trailing-whitespace)
; Auto insert C/C++ header guard
(add-hook 'find-file-hooks
	  (lambda ()
	    (when (and (memq major-mode '(c-mode c++-mode)) (equal (point-min) (point-max)) (string-match ".*\\.hh?" (buffer-file-name)))
	      (insert-header-guard)
	      (goto-line 3)
	      (insert "\n"))))
(add-hook 'find-file-hooks
	  (lambda ()
	    (when (and (memq major-mode '(c-mode c++-mode)) (equal (point-min) (point-max)) (string-match ".*\\.cc?" (buffer-file-name)))
	      (insert-header-inclusion))))

(add-hook 'sh-mode-hook
	  (lambda ()
            (insert-shebang-if-empty "/bin/sh")))

(add-hook 'ruby-mode-hook
	  (lambda ()
            (insert-shebang-if-empty "/usr/bin/ruby")))


; Start code folding mode in C/C++ mode
(add-hook 'c-mode-common-hook (lambda () (hs-minor-mode 1)))

;; file extensions
(add-to-list 'auto-mode-alist '("\\.l$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.y$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.ll$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.yy$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.xcc$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.xhh$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.pro$" . sh-mode)) ; Qt .pro files
(add-to-list 'auto-mode-alist '("configure$" . sh-mode))
(add-to-list 'auto-mode-alist '("Drakefile$" . c++-mode))
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG" . change-log-mode))

;; Font

(defconst default-font-size 105)

(defun set-font-size (&optional size)
  "Set the font size to SIZE (default: default-font-size)."
  (interactive "nSize: ")
  (unless size
    (setq size default-font-size))
  (set-face-attribute 'default nil :height size))

(set-face-attribute 'default nil :height 100)

(defun reset-font-size ()
  (interactive)
  (set-font-size))

(defun find-next (c l)
    (if (< c (car l))
        (car l)
      (if (cdr l)
          (find-next c (cdr l))
        (car l))))

(defun find-prev (c l &optional ac)
    (if (or (not l) (<= c (car l)))
        (if ac
            ac
          (car l))
      (find-prev c (cdr l) (car l))))

(defun current-font-size ()
  (face-attribute 'default :height))

(defconst font-sizes '(60 75 90 105 120 135 170 280))

(defun inc-font-size ()
  (interactive)
  (let ((new (find-next (current-font-size) font-sizes)))
    (set-font-size new)
    (message (concat "New font size: " (int-to-string new)))))

(defun dec-font-size ()
  (interactive)
  (let ((new (find-prev (current-font-size) font-sizes ())))
    (set-font-size new)
    (message (concat "New font size: " (int-to-string new)))))

;; Ido

(defconst has-ido emacs22)

(when has-ido
  (ido-mode t)

;; tab means tab, i.e. complete. Not "open this file", stupid.
  (setq ido-confirm-unique-completion t)
;; If the file doesn't exist, do try to invent one from a transplanar
;; directory. I just want a new file.
  (setq ido-auto-merge-work-directories-length -1)

;; Don't switch to GDB-mode buffers
  (add-to-list 'ido-ignore-buffers "locals"))

;; GNUSERV

(when has-gnuserv
  (gnuserv-start)
;  (global-set-key [(control x) (control c)] 'gnuserv-close-session)
  (add-hook 'gnuserv-visit-hook 'configure-frame)
  )

;; BINDINGS

;; BINDINGS :: font

(global-set-key [(control +)] 'inc-font-size)
(global-set-key [(control -)] 'dec-font-size)
(global-set-key [(control =)] 'reset-font-size)

;; BINDINGS :: windows

(global-unset-key [(control s)])
(global-set-key [(control s) (v)] 'split-window-horizontally)
(global-set-key [(control s) (h)] 'split-window-vertically)
(global-set-key [(control s) (d)] 'delete-window)
(global-set-key [(control s) (o)] 'delete-other-windows)

;; BINDINGS :: ido

(when has-ido
  (global-set-key [(control b)] 'ido-switch-buffer))

;; BINDINGS :: isearch
(global-set-key [(control f)] 'isearch-forward-regexp)  ; search regexp
(global-set-key [(control r)] 'query-replace-regexp)    ; replace regexp
(define-key
  isearch-mode-map
  [(control n)]
  'isearch-repeat-forward)                              ; next occurence
(define-key
  isearch-mode-map
  [(control p)]
  'isearch-repeat-backward)                             ; previous occurence
(define-key
  isearch-mode-map
  [(control z)]
  'isearch-cancel)                                      ; quit and go back to start point
(define-key
  isearch-mode-map
  [(control f)]
  'isearch-exit)                                        ; abort
(define-key
  isearch-mode-map
  [(control r)]
  'isearch-query-replace)                               ; switch to replace mode
(define-key
  isearch-mode-map
  [S-insert]
  'isearch-yank-kill)                                   ; paste
(define-key
  isearch-mode-map
  [(control e)]
  'isearch-toggle-regexp)                               ; toggle regexp
(define-key
  isearch-mode-map
  [(control l)]
  'isearch-yank-line)                                   ; yank line from buffer
(define-key
  isearch-mode-map
  [(control w)]
  'isearch-yank-word)                                   ; yank word from buffer
(define-key
  isearch-mode-map
  [(control c)]
  'isearch-yank-char)                                   ; yank char from buffer

;; BINDINGS :: Lisp

(define-key
  lisp-mode-map
  [(control c) (control f)]
  'insert-fixme)                                      ; insert fixme

;; BINDINGS :: Ruby

;(define-key
;  ruby-mode-map
;  [(control c) (control f)]
;  'insert-fixme)                                      ; insert fixme

;; BINDINGS :: C/C++

(require 'cc-mode)

(define-key
  c-mode-base-map
  [(control c) (w)]
  'c-switch-hh-cc)                                      ; switch between .hh and .cc
(define-key
  c-mode-base-map
  [(control c) (f)]
  'hs-hide-block)                                       ; fold code
(define-key
  c-mode-base-map
  [(control c) (s)]
  'hs-show-block)                                       ; unfold code
(define-key
  c-mode-base-map
  [(control c) (control n)]
  'c-insert-ns)                                         ; insert namespace
(define-key
  c-mode-base-map
  [(control c) (control s)]
  'c-insert-switch)                                     ; insert switch
(define-key
  c-mode-base-map
  [(control c) (control i)]
  'c-insert-if)                                         ; insert if
(define-key
  c-mode-base-map
  [(control c) (control b)]
  'c-insert-braces)                                     ; insert braces
(define-key
  c-mode-base-map
  [(control c) (control f)]
  'insert-fixme)                                      ; insert fixme
(define-key
  c-mode-base-map
  [(control c) (control d)]
  'c-insert-debug)                                      ; insert debug
(define-key
  c-mode-base-map
  [(control c) (control l)]
  'c-insert-class)                                      ; insert class

;; ;; BINDINGS :: C/C++ :: XRefactory

;; (define-key
;;   c-mode-base-map
;;   [(control c) (d)]
;;   'xref-push-and-goto-definition)                       ; goto definition
;; (define-key
;;   c-mode-base-map
;;   [(control c) (b)]
;;   'xref-pop-and-return)                                 ; go back
;; (define-key
;;   c-mode-base-map
;;   [C-return]
;;   'xref-completion)                                     ; complete

;; BINDINGS :: misc

(global-set-key [(meta =)]
                'stat-region)
(if (display-graphic-p)
    (global-set-key [(control z)] 'undo)                ; undo only in graphic mode
)
(global-set-key [(control a)] 'mark-whole-buffer)       ; select whole buffer
(global-set-key [(control return)] 'dabbrev-expand)     ; auto completion
(global-set-key [C-home] 'beginning-of-buffer)          ; go to the beginning of buffer
(global-set-key [C-end] 'end-of-buffer)                 ; go to the end of buffer
(global-set-key [(meta g)] 'goto-line)                  ; goto line #
(global-set-key [M-left] 'windmove-left)                ; move to left windnow
(global-set-key [M-right] 'windmove-right)              ; move to right window
(global-set-key [M-up] 'windmove-up)                    ; move to upper window
(global-set-key [M-down] 'windmove-down)
(global-set-key [(control c) (c)] 'build)
(global-set-key [(control c) (e)] 'next-error)
(global-set-key [(control tab)] 'other-window)          ; Ctrl-Tab = Next buffer
(global-set-key [C-S-iso-lefttab]
                '(lambda () (interactive)
                   (other-window -1)))                  ; Ctrl-Shift-Tab = Previous buffer
(global-set-key [(control delete)]
                'kill-word)                             ; kill word forward
(global-set-key [(meta ~)] 'ruby-command)               ; run ruby command

;; COLORS

(defun configure-frame ()
  (set-background-color "black")
  (set-foreground-color "white")
  (set-cursor-color "Orangered")
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   )
  (set-font-size))
(configure-frame)

;; Qt

(font-lock-add-keywords 'c++-mode
			'(("foreach\\|forever\\|emit" . 'font-lock-keyword-face)))

;; Lisp mode

(require 'lisp-mode)

(define-key
  lisp-mode-shared-map
  [(control c) (control c)]
  'comment-region)                                      ; comment


;; C / C++ mode

(require 'cc-mode)
(add-to-list 'c-style-alist
             '("epita"
               (c-basic-offset . 2)
               (c-comment-only-line-offset . 0)
               (c-hanging-braces-alist     . ((substatement-open before after)))
               (c-offsets-alist . ((topmost-intro        . 0)
                                   (substatement         . +)
                                   (substatement-open    . 0)
                                   (case-label           . +)
                                   (access-label         . -)
                                   (inclass              . ++)
                                   (inline-open          . 0)))))

(setq c-default-style "epita")

;; Compilation

(setq compilation-window-height 14)
(setq compilation-scroll-output t)

;; make C-Q RET insert a \n, not a ^M

(defadvice insert-and-inherit (before ENCULAY activate)
  (when (eq (car args) ?)
    (setcar args ?\n)))



;; Sessions

;; (desktop-load-default)
;; (desktop-read)

;; mmm mode

;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/mmm-mode/")
;; (require 'mmm-mode)
;; (setq mmm-global-mode 'maybe)

;; (defun foo ()
;;   (when (looking-back "^[ \t]*")
;;     (beginning-of-line)))

;; (mmm-add-classes
;;  '((cc-html
;;     :submode html-mode
;;     :face mmm-code-submode-face
;;     :front "\\('@\\|'@xml\\)\n?"
;;     :back "@'"
;;     :back-offset (foo))))


;; (mmm-add-classes
;;  '((ml-ext
;;     :submode text-mode
;;     :face mmm-code-submode-face
;;     :front "<:\\w*<"
;;     :back ">>"
;;     :back-offset (foo))))


;; (mmm-add-mode-ext-class 'c++-mode () 'cc-html)
;; (mmm-add-mode-ext-class 'tuareg-mode () 'ml-ext)

;; (setq mmm-submode-decoration-level 1)

;; (set-face-background 'mmm-default-submode-face "gray16")



(when has-ido
  (custom-set-variables
   '(ido-auto-merge-work-directories-length -1)
   '(ido-confirm-unique-completion t)
   '(ido-create-new-buffer (quote always))
   '(ido-everywhere t)
   '(ido-ignore-buffers (quote ("\\`\\*breakpoints of.*\\*\\'" "\\`\\*stack frames of.*\\*\\'" "\\`\\*gud\\*\\'" "\\`\\*locals of.*\\*\\'" "\\` ")))
   '(ido-mode (quote both) nil (ido))))

(custom-set-variables
 '(after-save-hook (quote (executable-make-buffer-file-executable-if-script-p)))
 '(require-final-newline t))

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(setq-default ispell-program-name "aspell")

(setq-default gdb-many-windows t)

;; Recognize test suite output

(require 'compile)
(add-to-list 'compilation-error-regexp-alist '("^\\(PASS\\|SKIP\\|XFAIL\\|TFAIL\\): \\(.*\\)$" 2 () () 0 2))
(add-to-list 'compilation-error-regexp-alist '("^\\(FAIL\\|XPASS\\): \\(.*\\)$" 2 () () 2 2))

;(require 'flymake)
;(add-hook 'find-file-hooks 'flymake-find-file-hook)

;; ;; Xrefactory configuration part ;;
;; ;; some Xrefactory defaults can be set here
;; (defvar xref-current-project nil) ;; can be also "my_project_name"
;; (defvar xref-key-binding 'global) ;; can be also 'local or 'none
;; (setq load-path (cons "/tmp/xref/emacs" load-path))
;; (setq exec-path (cons "/tmp/xref" exec-path))
;; (load "xrefactory")
;; ;; end of Xrefactory configuration part ;;
;; (message "xrefactory loaded")


;; Save and restore window layout

(defvar winconf-ring ())

(defun push-winconf ()
  (interactive)
  (window-configuration-to-register ?%)
  (push (get-register ?%) winconf-ring))

(defun pop-winconf ()
  (interactive)
  (set-register ?% (pop winconf-ring))
  (jump-to-register ?%))

(defun restore-winconf ()
  (interactive)
  (set-register ?% (car winconf-ring))
  (jump-to-register ?%))

(may-load "~/.emacs.local")
