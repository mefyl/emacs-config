;;;###autoload
(defun my-rm-set-mark (force)
  (interactive "P")
  (rm-set-mark force))

(global-set-key (kbd "C-x r C-SPC") 'rm-set-mark)
(global-set-key (kbd "C-w")
  '(lambda(b e) (interactive "r")
     (if rm-mark-active
       (rm-kill-region b e) (kill-region b e))))
(global-set-key (kbd "M-w")
  '(lambda(b e) (interactive "r")
     (if rm-mark-active
       (rm-kill-ring-save b e) (kill-ring-save b e))))
(global-set-key (kbd "C-x C-x")
  '(lambda(&optional p) (interactive "p")
     (if rm-mark-active
       (rm-exchange-point-and-mark p) (exchange-point-and-mark p))))


(provide 'my-rect-mark)
