(defun c++-project (sources incpath buildpath binary)
  (let ((root (file-name-directory load-file-name)))
    ;; Helper
    ;; FIXME: make that local
    (defun path (p) (if (file-name-absolute-p p) p (concat root "/" p)))

    ;; Compile command
    (setq compile-command (concat "cd " root "/" buildpath " && make"))

    ;; Include path
    (require 'my-c-mode)
    (require 'cmacexp)
    (mapcar (lambda (p) (c-add-include-path p)) incpath)

    ;; ;; Program to debug
    ;; ;(setq my-gdb-program (path binary))

    ;; Open files
    (mapcar (lambda (p) (find-file (path p))) sources)
    ))
