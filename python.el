(custom-set-variables
 '(python-indent 2))

(defun python-mode-setup ()

  ;; BINDINGS

  ;; comment
  (define-key
    python-mode-map
    [(control c) (control c)]
    'comment-region)

)

(add-hook 'python-mode-hook 'python-mode-setup)
