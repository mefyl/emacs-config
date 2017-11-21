;;;###autoload
(defun go-mode-setup ()
  (require 'go-mode-autoloads)
  (add-hook 'before-save-hook 'gofmt-before-save))
