;;;###autoload
(defun markdown-mode-setup ()
  (require 'markdown-mode)
  (flyspell-mode)

  ;; -------- ;;
  ;; BINDINGS ;;
  ;; -------- ;;

  ;; comment
  (define-key markdown-mode-map [(control c)
                                 (control c)] 'comment-region)

  ;; I reserve those to windmove
  (define-key markdown-mode-map [(meta left)] nil)
  (define-key markdown-mode-map [(meta right)] nil))

(provide 'my-markdown-mode)
