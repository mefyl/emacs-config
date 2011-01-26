(require 'cl)

;;;###autoload
(defun c++-project (incpath buildpath buildcmd binary args)
  (let ((root (file-name-directory load-file-name)))
    ;; Helper
    ;; FIXME: make that local
    (defun path (p) (if (file-name-absolute-p p) p (concat root p)))

    (defvar c++-project-root root
      "Root directory of the project.")

    (defvar c++-project-include-path incpath
      "Include path of the project, relative to c++-project-root.")

    ;; Compile command
    (setq compile-command (concat "cd " root "/" buildpath " && " buildcmd))

    ;; Include path
    (require 'my-c-mode)
    (require 'cmacexp)
    (mapcar (lambda (p) (c-add-include-path (path p))) incpath)

    ;; Program to debug
    (setq my-gdb-program (path (concat buildpath "/" binary)))
    (setq my-gdb-args args)

    ;; Open files
    ;; (mapcar (lambda (p) (find-file (path p))) sources)

    ;; Load tags
    (visit-tags-table (concat root "/TAGS"))

    ;; Override find-file
    (global-set-key [(control x) (control f)] 'c++-project-find-file)
    ))

(defun c++-project-files ()
  (save-excursion
    (visit-tags-table-buffer)
    (tags-table-files)))

(defun c++-project-files-headers ()
  (remove-if-not
   (lambda (path) (when (string-match "\\(\\.hh\\|\\.h\\)$" path) path))
   (c++-project-files)))

(defun c++-project-include-re (path)
  (concat "^" path "/"))

(defun c++-project-files-includes ()
  (remove-if-not
   (lambda (x) x)
   (mapcar
    (lambda (path)
      (let ((incpath (find-if
                      (lambda (incpath) (string-match (c++-project-include-re incpath) path))
                      c++-project-include-path)))
        (when incpath
          (let ((re (c++-project-include-re incpath)))
            (when (string-match re path)
              (replace-regexp-in-string re "" path))))))
    (c++-project-files-headers))))



(defun c++-project-find-file (&optional any)
  (interactive "P")
  (if any
      (ido-find-file)
    (find-file (ido-completing-read "File: " (c++-project-files) () t "" () ()))))
