;;;###autoload
(defun my-log-view-mode-setup ()
  (load-library "ansi-color")
  (ansi-color-apply-on-region (point-min) (point-max)))
