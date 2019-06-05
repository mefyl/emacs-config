(require 'my-helpers)

(defun tuareg-switch-mli-ml ()
  (interactive)
  (find-next-file '("ml" "mli")))

;;;###autoload
(defun tuareg-mode-setup ()

  ;; OPAM
  (let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
    (when (and opam-share (file-directory-p opam-share))
      ;; Register Merlin
      (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))))

  ;; Merlin
  (autoload 'merlin-mode "merlin" nil t nil)
  (add-hook 'tuareg-mode-hook 'merlin-mode t)
  (add-hook 'caml-mode-hook 'merlin-mode t)
  (setq merlin-command 'opam) ;; Use opam switch to lookup ocamlmerlin binary
  (require 'auto-complete)
  (setq merlin-use-auto-complete-mode 'easy)

  ;; Format
  (require 'ocamlformat)
  (add-hook 'before-save-hook 'ocamlformat-before-save)

  ;; Bindings
  (define-key tuareg-mode-map [(control c) (control c)] 'comment-region)
  (define-key tuareg-mode-map [(control c) (control f)] 'insert-fixme)
  (define-key tuareg-mode-map [(control c) ?w] 'tuareg-switch-mli-ml)
  (define-key tuareg-mode-map [(meta /)] 'auto-complete)
  (define-key tuareg-mode-map [(meta .)] 'merlin-locate))
