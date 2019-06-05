(require 'go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'before-save-hook 'goimports-before-save)
(define-key go-mode-map [(control c) (control c)] 'comment-region)
(define-key go-mode-map [(meta .)] 'godef-jump)

(custom-set-variables
 '(gofmt-args (quote ("-s"))))

;; Mostly copied from go-mode.el

;;;###autoload
(defun goimports-before-save ()
  "Add this to .emacs to run goimports on the current buffer when saving:
 (add-hook 'before-save-hook 'goimports-before-save).
Note that this will cause go-mode to get loaded the first time
you save any file, kind of defeating the point of autoloading."

  (interactive)
  (when (eq major-mode 'go-mode) (goimports)))

(defun goimports ()
  "Formats the current buffer according to the goimports tool."

  (interactive)
  (let ((tmpfile (make-temp-file "goimports" nil ".go"))
        (patchbuf (get-buffer-create "*Goimports patch*"))
        (errbuf (get-buffer-create "*Goimports Errors*"))
        (coding-system-for-read 'utf-8)
        (coding-system-for-write 'utf-8))

    (with-current-buffer errbuf
      (setq buffer-read-only nil)
      (erase-buffer))
    (with-current-buffer patchbuf
      (erase-buffer))

    (write-region nil nil tmpfile)

    ;; We're using errbuf for the mixed stdout and stderr output. This
    ;; is not an issue because goimports -w does not produce any stdout
    ;; output in case of success.
    (if (zerop (call-process "/usr/lib64/go/bin/goimports" nil errbuf nil "-w" tmpfile))
        (if (zerop (call-process-region (point-min) (point-max) "diff" nil patchbuf nil "-n" "-" tmpfile))
            (progn
              (kill-buffer errbuf)
              (message "Buffer is already goimportsed"))
          (go--apply-rcs-patch patchbuf)
          (kill-buffer errbuf)
          (message "Applied goimports"))
      (message "Could not apply goimports. Check errors for details")
      (goimports--process-errors (buffer-file-name) tmpfile errbuf))

    (kill-buffer patchbuf)
    (delete-file tmpfile)))

;;;###autoload
(defun go-mode-setup ()
  (require 'go-mode-autoloads))
