(provide 'my-elisp)

(defun remove-prefix-from-string (prefix string)
  (let ((rg (concat "^" prefix)))
    (replace-regexp-in-string rg "" path)))

(defun current-file-name ()
  (buffer-file-name (current-buffer)))
