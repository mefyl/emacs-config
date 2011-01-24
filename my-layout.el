(defun window-set-width (&optional width)
  (interactive "P")
  (let ((width (or width 80)))
    (shrink-window (- (window-width) width) t)))
