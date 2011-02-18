;;;###autoload
(defun window-set-width (&optional width)
  (interactive "P")
  (let ((width (or width 80)))
    (shrink-window (- (window-width) width) t)))

;;;###autoload
(defun toggle-current-window-dedication ()
 (interactive)
 (let* ((window    (selected-window))
        (dedicated (window-dedicated-p window)))
   (set-window-dedicated-p window (not dedicated))
   (message "Window %sdedicated to %s"
            (if dedicated "no longer " "")
            (buffer-name))))

(global-set-key [pause] 'toggle-current-window-dedication)
