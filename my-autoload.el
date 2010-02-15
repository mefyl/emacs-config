(defun autoloads (functions file)
  (let ((load (lambda (function)
                (autoload (elt function 0) file
                  (elt function 1) (elt function 2)))))
    (mapcar load functions))
  functions)

(autoload 'my-rebox-comment
  "my-rebox" "Draw nice boxes around comments" t)

(autoload 'insert-fixme
  "my-fixme" "Insert fixme" t)

(autoload 'sh-mode-setup
  "my-sh-mode" "Customize shell mode" t)

(autoload 'c++-project
  "my-c-project" "Define C++ project configuration" t)

(autoloads (list (list 'insert-shebang "Insert shebang." t)
                 (list 'insert-shebang-if-absent "Insert shebang unless there's already one" ())
                 (list 'insert-shebang-if-empty "Insert shebang if the buffer is empty" ()))
           "my-shebang")

(provide 'my-autoload)
