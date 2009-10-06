(defun sh-mode-setup ()
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
