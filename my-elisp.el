(defun remove-prefix-from-string (prefix string)
  (let ((rg (concat "^" prefix)))
    (replace-regexp-in-string rg "" path)))

(defun current-file-name ()
  (buffer-file-name (current-buffer)))

(defun filter (condp l)
  (if l
    (let ((head (car l))
          (tail (filter condp (cdr l))))
      (if (funcall condp head)
        (cons head tail)
        tail))
    ()))

(provide 'my-elisp)
