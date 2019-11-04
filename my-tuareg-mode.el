(require 'my-helpers)

(defun tuareg-switch-mli-ml ()
  (interactive)
  (find-next-file '("ml" "mli")))

;;;###autoload
(defun tuareg-mode-setup ()
  ;; Merlin
  (if
      (require 'merlin nil 'noerror)
      (progn (add-hook 'tuareg-mode-hook 'merlin-mode t)
             (add-hook 'caml-mode-hook 'merlin-mode t)
             (setq merlin-command 'opam) ;; Use opam switch to lookup ocamlmerlin binary
             (require 'auto-complete)
             (setq merlin-use-auto-complete-mode 'easy))
    (warn
     "merlin not installed"))

  ;; Ocamlformat
  (if
      (require 'ocamlformat nil 'noerror)
      (add-hook 'before-save-hook 'ocamlformat-before-save)
    (warn
     "ocamlformat not installed"))

  ;; Bindings
  (define-key tuareg-mode-map [(control c)
                               (control c)] 'comment-region)
  (define-key tuareg-mode-map [(control c)
                               (control f)] 'insert-fixme)
  (define-key tuareg-mode-map [(control c) ?w] 'tuareg-switch-mli-ml)
  (define-key tuareg-mode-map [(meta /)] 'auto-complete)
  (define-key tuareg-mode-map [(meta .)] 'merlin-locate))
