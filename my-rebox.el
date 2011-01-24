(require 'rebox)

(defvar my-rebox-style)

(make-variable-buffer-local 'my-rebox-style)

;;;###autoload
(defun my-rebox-comment (style)
  (interactive "P")
  (if style
    (rebox-comment my-rebox-style)
    (rebox-comment nil)))

(provide 'my-rebox)
