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

(defconst conf-dir (concat (getenv "HOME") "/.emacs.conf/")
  "Location of the configuration files")
(add-to-list 'load-path conf-dir)
(add-to-list 'load-path (concat (getenv "HOME") "/local/share/emacs/site-lisp/"))
(set 'generated-autoload-file (concat conf-dir "my-autoload.el"))
(require 'my-autoload)
(require 'my-elisp)

;; Modes setup
(add-hook 'conf-mode-hook 'conf-mode-setup)
(add-hook 'c++-mode-hook 'c++-mode-setup)
(add-hook 'log-view-mode-hook 'my-log-view-mode-setup)
(add-hook 'python-mode-hook 'python-mode-setup)
(add-hook 'sh-mode-hook 'sh-mode-setup)
(add-hook 'yaml-mode-hook 'yaml-mode-setup)
(add-hook 'go-mode-hook 'go-mode-setup)
(add-hook 'magit-mode-hook 'magit-setup)
(add-hook 'tuareg-load-hook 'tuareg-mode-setup)
(eval-after-load "lisp-mode" '(lisp-mode-setup))

(defconst has-gnuserv (fboundp 'gnuserv-start)
  "Whether gnuserv is available")

;; Version detection

(defconst xemacs (string-match "XEmacs" emacs-version)
  "non-nil iff XEmacs, nil otherwise")

(defconst emacs-major (string-to-number (replace-regexp-in-string "\\..*" "" emacs-version))
  "Emacs major version")

;; CUSTOM FUNCTIONS

;; Reload conf

(defun reload ()
  (interactive)
  (load-file "~/.emacs"))

;; Edition

(defun count-word (start end)
  (let ((begin (min start end))
        (end (max start end)))
    (save-excursion (goto-char begin)
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
  (let ((words (count-word start end))
        (lines (count-lines start end)))
    (message (concat "Lines: " (int-to-string lines) "  Words: " (int-to-string words)))))

(defun ruby-command (cmd &optional output-buffer error-buffer)
  "Like shell-command, but using ruby."
  (interactive (list (read-from-minibuffer "Ruby command: " nil nil nil 'ruby-command-history)
                     current-prefix-arg shell-command-default-error-buffer))
  (shell-command (concat "ruby -e '" cmd "'") output-buffer error-buffer))

(defun python-command (cmd &optional output-buffer error-buffer)
  "Like shell-command, but using python."
  (interactive (list (read-from-minibuffer "Python command: " nil nil nil 'python-command-history)
                     current-prefix-arg shell-command-default-error-buffer))
  (shell-command (concat "python -c '" (replace-regexp-in-string "'" "'\\\\''" cmd) "'")
                 output-buffer error-buffer))

;; OPTIONS

(setq inhibit-startup-message t)    ; don't show the GNU splash screen
(setq frame-title-format "%b")      ; titlebar shows buffer's name
(global-font-lock-mode t)           ; syntax highlighting
(setq font-lock-maximum-decoration t)   ; max decoration for all modes
(setq line-number-mode 't)              ; line number
(setq column-number-mode 't)            ; column number
(when (display-graphic-p)
  (progn (scroll-bar-mode -1)           ; no scroll bar
         (menu-bar-mode -1)             ; no menu bar
         (tool-bar-mode -1)             ; no tool bar
         (mouse-wheel-mode t)))         ; enable mouse wheel


(setq delete-auto-save-files t)    ; delete unnecessary autosave files
(setq delete-old-versions t)       ; delete oldversion file
(setq normal-erase-is-backspace-mode t) ; make delete work as it should
(fset 'yes-or-no-p 'y-or-n-p)        ; 'y or n' instead of 'yes or no'
(setq default-major-mode 'text-mode) ; change default major mode to text
(setq ring-bell-function 'ignore)    ; turn the alarm totally off
(setq make-backup-files nil)         ; no backupfile
(auto-image-file-mode)               ; show picture in emacs
(show-paren-mode t)                  ; match parenthesis
(setq-default indent-tabs-mode nil) ; don't use fucking tabs to indent

;; HOOKS

;; Delete trailing whitespaces on save
(add-hook 'write-file-hooks (lambda ()
                              (when (not (eq major-mode 'mail-mode))
                                (delete-trailing-whitespace))))

(add-hook 'ruby-mode-hook (lambda ()
                            (insert-shebang-if-empty "/usr/bin/ruby")))


;; Start code folding mode in C/C++ mode
(add-hook 'c-mode-common-hook (lambda ()
                                (hs-minor-mode 1)))

;; file extensions
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG" . change-log-mode))
(add-to-list 'auto-mode-alist '("ChangeLog$" . markdown-mode))
(add-to-list 'auto-mode-alist '("Dockerfile$" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.ebuild$" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.l$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.ll$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.log\\'" . elle-log-mode))
(add-to-list 'auto-mode-alist '("\\.pro$" . sh-mode)) ; Qt .pro files
(add-to-list 'auto-mode-alist '("\\.qml$" . qml-mode))
(add-to-list 'auto-mode-alist '("\\.sls$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.tmpl$" () t))
(add-to-list 'auto-mode-alist '("\\.xcc$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.xhh$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.y$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yy$" . c++-mode))
(add-to-list 'auto-mode-alist '("configure$" . sh-mode))
(add-to-list 'auto-mode-alist '("drake$" . python-mode))
(add-to-list 'auto-mode-alist '("drakefile$" . python-mode))
(add-to-list 'auto-mode-alist '("dune\\(-project\\)?$" . lisp-mode))
(add-to-list 'interpreter-mode-alist '("python3" . python-mode))

;; Markdown

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-hook 'markdown-mode-hook 'markdown-mode-setup)

;; HTML

(add-hook 'html-mode-hook 'html-mode-setup)

;; Ido

(defconst has-ido (>= emacs-major 22))

(when has-ido (ido-mode t)
      ;; tab means tab, i.e. complete. Not "open this file", stupid.
      (setq ido-confirm-unique-completion t)
      ;; If the file doesn't exist, do not try to invent one from a
      ;; transplanar directory. I just want a new file.
      (setq ido-auto-merge-work-directories-length -1)
      ;; Don't switch to GDB-mode buffers
      (add-to-list 'ido-ignore-buffers "locals")
      (flx-ido-mode)
      ;; disable ido faces to see flx highlights.
      ;; (setq ido-use-faces nil)
      )

;; GNUSERV

(when has-gnuserv (gnuserv-start))

;; BINDINGS

;; BINDINGS :: windows

(global-unset-key [(control s)])
(global-set-key [(control s)
                 (v)] 'split-window-horizontally)
(global-set-key [(control s)
                 (h)] 'split-window-vertically)
(global-set-key [(control s)
                 (d)] 'delete-window)
(global-set-key [(control s)
                 (o)] 'delete-other-windows)

;; BINDINGS :: ido

(when has-ido (global-set-key [(control b)] 'ido-switch-buffer)
      (define-key ido-file-completion-map [(control d)] 'ido-make-directory))

;; BINDINGS :: isearch
(global-set-key [(control f)] 'isearch-forward-regexp) ; search regexp
(global-set-key [(control r)] 'query-replace-regexp) ; replace regexp
(define-key isearch-mode-map [(control n)] 'isearch-repeat-forward) ; next occurence
(define-key isearch-mode-map [(control p)] 'isearch-repeat-backward) ; previous occurence
(define-key isearch-mode-map [(control z)] 'isearch-cancel) ; quit and go back to start point
(define-key isearch-mode-map [(control f)] 'isearch-exit)   ; abort
(define-key isearch-mode-map [(control r)] 'isearch-query-replace) ; switch to replace mode
(define-key isearch-mode-map [S-insert] 'isearch-yank-kill) ; paste
(define-key isearch-mode-map [(control e)] 'isearch-toggle-regexp) ; toggle regexp
(define-key isearch-mode-map [(control l)] 'isearch-yank-line) ; yank line from buffer
(define-key isearch-mode-map [(control w)] 'isearch-yank-word) ; yank word from buffer
(define-key isearch-mode-map [(control c)] 'isearch-yank-char) ; yank char from buffer

;; BINDINGS :: Lisp

(define-key lisp-mode-map [(control c)
                           (control f)] 'insert-fixme) ; insert fixme

;; BINDINGS :: misc

(global-set-key [(meta =)] 'stat-region)
(if (display-graphic-p)
    (global-set-key [(control z)] 'undo) ; undo only in graphic mode
  )
(global-set-key [(control a)] 'mark-whole-buffer) ; select whole buffer
(global-set-key [(control return)] 'dabbrev-expand) ; auto completion
(global-set-key [C-home] 'beginning-of-buffer) ; go to the beginning of buffer
(global-set-key [C-end] 'end-of-buffer)    ; go to the end of buffer
(global-set-key [(meta g)] 'goto-line)     ; goto line #
(global-set-key [M-left] 'windmove-left)   ; move to left windnow
(global-set-key [M-right] 'windmove-right) ; move to right window
(global-set-key [M-up] 'windmove-up)       ; move to upper window
(global-set-key [M-down] 'windmove-down)
(global-set-key [(control c)
                 (c)] 'my-recompile)
(global-set-key [(control c)
                 (e)] 'next-error)
(global-set-key [(control tab)] 'other-window) ; Ctrl-Tab = Next buffer
(global-set-key [C-S-iso-lefttab]
                '(lambda ()
                   (interactive)
                   (other-window -1))) ; Ctrl-Shift-Tab = Previous buffer
(global-set-key [(control delete)] 'kill-word) ; kill word forward
(global-set-key [(meta ~)] 'python-command)    ; run python command

;; COLORS

(defun configure-frame ()
  (set-background-color "black")
  (set-foreground-color "white")
  (set-cursor-color "Orangered"))
(configure-frame)
(add-to-list 'after-make-frame-functions (lambda (f)
                                           (select-frame f)
                                           (configure-frame)))

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



(when has-ido (custom-set-variables '(ido-auto-merge-work-directories-length -1)
                                    '(ido-confirm-unique-completion t)
                                    '(ido-create-new-buffer (quote always))
                                    '(ido-everywhere t)
                                    '(ido-ignore-buffers (quote ("\\`\\*breakpoints of.*\\*\\'"
                                                                 "\\`\\*stack frames of.*\\*\\'"
                                                                 "\\`\\*gud\\*\\'"
                                                                 "\\`\\*locals of.*\\*\\'" "\\` ")))
                                    '(ido-mode (quote both) nil (ido))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(after-save-hook (quote (executable-make-buffer-file-executable-if-script-p)))
 '(wdired-allow-to-change-permissions t)
 '(css-indent-offset 2)
 '(gdb-max-frames 1024)
 '(ido-auto-merge-work-directories-length -1)
 '(ido-confirm-unique-completion t)
 '(ido-create-new-buffer (quote always))
 '(ido-everywhere t)
 '(ido-ignore-buffers (quote ("\\`\\*breakpoints of.*\\*\\'" "\\`\\*stack frames of.*\\*\\'"
                              "\\`\\*gud\\*\\'" "\\`\\*locals of.*\\*\\'" "\\` ")))
 '(ido-mode (quote both) nil (ido))
 '(js-indent-level 2)
 '(line-move-visual nil)
 '(python-indent 2)
 '(python-indent-offset 2)
 '(require-final-newline t)
 '(safe-local-variable-values (quote ((encoding . utf-8)))))

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(setq-default ispell-program-name "aspell")

(setq-default gdb-many-windows t)

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

(prefer-coding-system 'utf-8)

;; Framemove
(require 'framemove)
(windmove-default-keybindings)
(setq framemove-hook-into-windmove t)

;; Rectangle Mark
(global-set-key (kbd "C-x r C-SPC") 'my-rm-set-mark)

;; Recognize dead keys
(require 'iso-transl)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-diff-add ((((class color)
                     (background dark))
                    (:foreground "green"))))
 '(magit-diff-file-header ((t
                            (:inherit magit-header
                                      :weight bold
                                      :height 1.6))))
 '(magit-diff-hunk-header ((t
                            (:inherit magit-header
                                      :weight bold
                                      :height 1.3))))
 '(magit-diff-none ((t
                     (:foreground "grey80"))))
 '(magit-header ((t nil)))
 '(magit-section-title ((t
                         (:inherit magit-header
                                   :underline t
                                   :weight bold
                                   :height 2.0)))))

(setq x-alt-keysym 'meta)
