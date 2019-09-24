;;;###autoload
(defun lisp-mode-setup ()

  ;; ------ ;;
  ;; Format ;;
  ;; ------ ;;
  (require 'elisp-format)
  (add-hook 'before-save-hook (lambda ()
                                (when (derived-mode-p 'emacs-lisp-mode 'lisp-mode)
                                  (elisp-format-buffer))))

  ;; ------------- ;;
  ;; Configuration ;;
  ;; ------------- ;;
  (set 'my-rebox-style 523)

  ;; -------- ;;
  ;; Bindings ;;
  ;; -------- ;;
  (define-key lisp-mode-shared-map [(meta q)] 'my-rebox-comment))

(provide 'my-lisp-mode)
