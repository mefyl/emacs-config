(require 'conf-mode)

(define-key conf-mode-map [(control c)
                           (control c)] 'comment-region)

;;;###autoload
(defun conf-mode-setup ())
