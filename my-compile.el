;;;###autoload
(defun my-recompile ()
  (interactive)
  (if (string-equal compile-command "")
      (let ((path (cwd)))
        (while (not (or (file-readable-p (concat path "/Makefile")) (string-equal path "")))
          (message path)
          (setq path (replace-regexp-in-string "/[^/]*\\'" "" path)))
        (message path)
        (if (string-equal path "")
            (message "No Makefile found.")
          (progn
            (setq path (replace-regexp-in-string " " "\\\\ " path))
            (compile (concat "make -C " path)))))
    (recompile)))

(defun my-compilation-hook ()
  (when (not (get-buffer-window "*compilation*"))
    (save-selected-window
      (save-excursion
        (let* ((w (split-window-vertically))
               (h (window-height w)))
          (select-window w)
          (switch-to-buffer "*compilation*")
          (shrink-window (- h compilation-window-height)))))))
(add-hook 'compilation-mode-hook 'my-compilation-hook)

;;;###autoload
(defconst
  system-cores-logical
  (string-to-number (shell-command-to-string "nproc"))
  "number of logical processing unit on this system")
