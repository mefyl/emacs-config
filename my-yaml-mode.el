;;;###autoload
(defun yaml-mode-setup ()

  ;; -------- ;;
  ;; BINDINGS ;;
  ;; -------- ;;

  ;; comment
  (define-key
    yaml-mode-map
    [(control c) (control c)]
    'comment-region)

  ;; rebox
  (define-key
    yaml-mode-map
    [(meta q)]
    'my-rebox-comment)

)

(add-hook 'yaml-mode-hook 'yaml-mode-setup)

(provide 'my-yaml-mode)
