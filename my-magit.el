(require 'magit)

;;;###autoload
(defun magit-setup ()
  (add-to-list 'magit-no-confirm 'amend-published)
  (add-to-list 'magit-no-confirm 'edit-published)
  (add-to-list 'magit-no-confirm 'rebase-published))
