(custom-set-variables
 '(python-indent 2))

;;;###autoload
(defun python-mode-setup ()

  ;; ------------- ;;
  ;; CONFIGURATION ;;
  ;; ------------- ;;

  ;; Comment boxing style
  (set 'my-rebox-style 423)
  ;; Set fill column to 100 instead of 72
  (set-fill-column 100)
  ;; Show fill column indicator.
  (fci-mode)

  ;; -------- ;;
  ;; BINDINGS ;;
  ;; -------- ;;

  ;; comment
  (define-key
    python-mode-map
    [(control c) (control c)]
    'comment-region)

  ;; rebox
  (define-key
    python-mode-map
    [(meta q)]
    'my-rebox-comment)

)

(add-hook 'python-mode-hook 'python-mode-setup)

(provide 'my-python-mode)
