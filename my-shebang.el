(defun insert-shebang (bin)
  (interactive "sBin: ")
  (save-excursion
    (goto-char (point-min))
    (insert "#!" bin "\n\n")))

(defun insert-shebang-if-absent (bin)
  (save-excursion
    (goto-char (point-min))
    (unless (looking-at "#!")
      (insert-shebang bin))))

(defun insert-shebang-if-empty (bin)
  (when (buffer-empty-p)
    (insert-shebang bin)))

(provide 'my-shebang)
