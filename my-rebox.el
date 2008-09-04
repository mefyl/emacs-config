(require 'rebox)

(defvar my-rebox-style 523)

(make-variable-buffer-local 'my-rebox-style)
;  523 lisp

(defun my-rebox-comment (style)
  (interactive "P")
  (if style
      (let ((rebox-default-style my-rebox-style)) (rebox-comment nil))
      (rebox-comment nil)))

;; (defun setup-c-rebox ()
;;   (local-set-key "\M-q" 'my-rebox-comment))

;; (add-hook 'c++-mode-hook 'setup-c-rebox)

(provide 'my-rebox)
