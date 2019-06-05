(defvar compilation-files
  '(("drakefile" . (lambda (p)
                     (concat "drake -C " p)))
    ("dune-project" . (lambda (p)
                        (concat "dune build --root " p)))
    ("Makefile" . (lambda (p)
                    (concat "make -C " p)))))

(defun find-compilation-file (root)
  (let ((root (file-name-as-directory root)))
    (message root)
    (cl-some (lambda (f)
               (if (file-readable-p (concat root (car f))) f)) compilation-files)))

(defun find-parent-compilation-file (root)
  (let ((file (find-compilation-file root)))
    (if file (cons root file)
      (when (not (string-equal root "/"))
        (find-parent-compilation-file (file-name-directory (directory-file-name root)))))))

(defun find-compilation-command (p)
  (let ((file (find-parent-compilation-file p)))
    (if file (funcall (cdr (cdr file))
                      (car file)))))

;;;###autoload
(defun my-recompile ()
  (interactive)
  (if (string-equal compile-command "make -k ")
      (let ((command (find-compilation-command (cwd))))
        (if command (compile command)
          (message "No compilation command found.")))
    (recompile)))

(defun my-compilation-hook ()
  (when (not (get-buffer-window "*compilation*"))
    (save-selected-window (save-excursion (let* ((w (split-window-vertically))
                                                 (h (window-height w)))
                                            (select-window w)
                                            (switch-to-buffer "*compilation*")
                                            (shrink-window (- h compilation-window-height)))))))
(add-hook 'compilation-mode-hook 'my-compilation-hook)

;;;###autoload
(defconst system-cores-logical (string-to-number (shell-command-to-string "nproc"))
  "number of logical processing unit on this system")
