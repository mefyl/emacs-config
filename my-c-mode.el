(defun c-mode-setup ()

  (require 'my-elisp)

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
        (let ((rg (concat "^" (car paths))))
          (if (string-match rg path)
              (concat "<" (replace-regexp-in-string rg "" path) ">")
            (c-simplify-include path (cdr paths))))
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

  (defun c-insert-include-bouncer (std)
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

  ;; ------------- ;;
  ;; Configuration ;;
  ;; ------------- ;;

  ;; Rebox with C-style comments
  (set 'my-rebox-style 223)

  ;; -------- ;;
  ;; Bindings ;;
  ;; -------- ;;

  ;; Insert inclusion
  (define-key
    c-mode-base-map
    [(control c) (control i)]
    'c-insert-include-bouncer)

  ;; Rebox comment
  (define-key
    c-mode-base-map
    [(meta q)]
    'my-rebox-comment)
)

(add-hook 'c++-mode-hook 'c-mode-setup)

(provide 'my-c-mode)
