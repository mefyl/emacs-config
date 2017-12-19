(require 'go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)
(define-key go-mode-map [(control c) (control c)] 'comment-region)
(define-key go-mode-map [(meta .)] 'godef-jump)

(custom-set-variables
 '(gofmt-args (quote ("-s"))))

;;;###autoload
(defun go-mode-setup ()
  (require 'go-mode-autoloads))
