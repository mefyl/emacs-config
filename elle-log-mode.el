(defvar elle-log-mode-hook nil)

(defvar elle-log-mode-map
  (let ((map (make-keymap)))
    map)
  "Keymap for elle-log major mode")

;;;###autoload
(defun elle-log-mode ()
  "Major mode for viewing elle log files"
  (interactive)
  (kill-all-local-variables)
  (use-local-map elle-log-mode-map)
  (load-library "ansi-color")
  (ansi-color-apply-on-region (point-min) (point-max)))
