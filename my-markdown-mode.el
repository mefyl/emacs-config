;;;###autoload
(defun markdown-mode-setup ()

  (require 'markdown-mode)

  (flyspell-mode)

  ;; -------- ;;
  ;; BINDINGS ;;
  ;; -------- ;;

  ;; comment
  (define-key
    markdown-mode-map
    [(control c) (control c)]
    'comment-region)

)

(provide 'my-markdown-mode)
