;;;###autoload
(defun html-mode-setup ()

  (require 'sgml-mode)

  (flyspell-mode)

  ;; -------- ;;
  ;; BINDINGS ;;
  ;; -------- ;;

  ;; comment
  (define-key
    html-mode-map
    [(control c) (control c)]
    'comment-region)
)

(provide 'my-html-mode)
