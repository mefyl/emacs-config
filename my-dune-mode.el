(defconst dune-binary (expand-file-name "dune" (car (process-lines "opam" "config" "var" "bin")))
  "dune binary path")

;;;###autoload
(defun dune-mode-setup ()
  (add-hook 'write-contents-functions (lambda ()
                                        (let ((cmd (concat dune-binary " " "format-dune-file"))
                                              (point (point)))
                                          (progn (shell-command-on-region (point-min)
                                                                          (point-max) cmd
                                                                          (current-buffer))
                                                 (goto-char point) nil)))))
