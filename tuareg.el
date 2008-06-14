(defun tuareg-mode-setup ()

  ;; BINDINGS

  ;; comment
  (define-key
    tuareg-mode-map
    [(control c) (control c)]
    'comment-region)
  ;; insert fixme
  (define-key
    tuareg-mode-map
    [(control c) (control f)]
    'insert-fixme)

  ;; MISC

  (setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
)

(add-hook 'tuareg-load-hook 'tuareg-mode-setup)
