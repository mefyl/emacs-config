(require 'cl)
(require 'my-c-mode)

;;;###autoload
(defun python-project (buildpath buildcmd)
  (let ((root (file-name-directory load-file-name)))
    ;; Helper
    ;; FIXME: make that local
    (defun path (p) (if (file-name-absolute-p p) p (concat root p)))

    (defvar python-project-root root
      "Root directory of the project.")

    ;; Compile command
    (setq compile-command (concat "cd " root "/" buildpath " && " buildcmd))

    ;; Load tags
    (visit-tags-table (concat root "/TAGS"))

    ;; Override find-file
    (global-set-key [(control x) (control f)] 'python-project-find-file)

    (find-file root)

    ;; Open compilation window
    (save-excursion
      (let ((w (split-window-vertically)))
        (select-window w)
        (switch-to-buffer "*compilation*")
        (shrink-window (- (window-height w) compilation-window-height))
        (set-window-dedicated-p w t)))
    (other-window 1)

    ;; Open magit
    (save-excursion
      (let ((w (split-window-horizontally)))
        (magit-status root)))
    (other-window 2)))

(defun python-project-files ()
  (save-excursion
    (visit-tags-table-buffer)
    (tags-table-files)))

(defun python-project-find-file (&optional any)
  (interactive "P")
  (if any
      (ido-find-file)
    (find-file (concat python-project-root
                       (ido-completing-read "File: " (python-project-files)
                                            () t "" () ())))))
