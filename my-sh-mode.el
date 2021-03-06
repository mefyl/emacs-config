;;;###autoload
(defun sh-mode-setup ()

  ;; Insert shebang
  (insert-shebang-if-absent "/bin/sh")

  ;; -------- ;;
  ;; Bindings ;;
  ;; -------- ;;

  ;; Comment
  (define-key
    sh-mode-map
    [(control c) (control c)]
    'comment-region)

  )

(provide 'my-sh-mode)
