(require 'cl)
(require 'my-c-mode)

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
   (lambda (path) (when (string-match "\\(\\.hh\\|\\.hxx\\|\\.h\\)$" path) path))
   (c++-project-files)))

(defun c++-project-include-re (path)
  (if (string-equal path "")
      ""
    (concat "^" path "/")))

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
    (find-file (concat c++-project-root
                       (ido-completing-read "File: " (c++-project-files)
                                            () t "" () ())))))

(defun c++-project-insert-local-include (name)
  (interactive (list (ido-completing-read "Include: " (c++-project-files-includes) () t "" () ())))
  (save-excursion
    (c-open-preproc)
    (insert "include <")
    (insert name)
    (insert ">")))

(defun c++-project-insert-standard-include (name)
  (interactive "sInclude: \n")
  (save-excursion
    (c-open-preproc)
    (insert "include <")
    (insert name)
    (insert ">")))

(defun c++-project-insert-include (std)
  (interactive "P")
  (if std
      (call-interactively 'c++-project-insert-standard-include)
    (call-interactively 'c++-project-insert-local-include)))

(define-key c-mode-base-map [(control c) (control i)] 'c++-project-insert-include)
