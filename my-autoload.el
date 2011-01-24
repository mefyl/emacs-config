
;;;### (autoloads (c++-project) "my-c-project" "my-c-project.el"
;;;;;;  (19773 58786))
;;; Generated autoloads from my-c-project.el

(autoload (quote c++-project) "my-c-project" "\
Not documented

\(fn SOURCES INCPATH BUILDPATH BUILDCMD BINARY ARGS)" nil nil)

;;;***

;;;### (autoloads (insert-fixme) "my-fixme" "my-fixme.el" (19773
;;;;;;  58737))
;;; Generated autoloads from my-fixme.el

(autoload (quote insert-fixme) "my-fixme" "\
Not documented

\(fn &optional MSG)" t nil)

;;;***

;;;### (autoloads (window-set-width) "my-layout" "my-layout.el" (19773
;;;;;;  58124))
;;; Generated autoloads from my-layout.el

(autoload (quote window-set-width) "my-layout" "\
Not documented

\(fn &optional WIDTH)" t nil)

;;;***

;;;### (autoloads (my-rebox-comment) "my-rebox" "my-rebox.el" (19773
;;;;;;  58722))
;;; Generated autoloads from my-rebox.el

(autoload (quote my-rebox-comment) "my-rebox" "\
Not documented

\(fn STYLE)" t nil)

;;;***

;;;### (autoloads (sh-mode-setup) "my-sh-mode" "my-sh-mode.el" (19773
;;;;;;  58754))
;;; Generated autoloads from my-sh-mode.el

(autoload (quote sh-mode-setup) "my-sh-mode" "\
Not documented

\(fn)" nil nil)

;;;***

;;;### (autoloads (resume save-current-configuration wipe restore-window-configuration
;;;;;;  current-window-configuration-printable) "revive" "revive.el"
;;;;;;  (19751 33611))
;;; Generated autoloads from revive.el

(autoload (quote current-window-configuration-printable) "revive" "\
Return the printable current-window-configuration.
This configuration will be stored by restore-window-configuration.
Returned configurations are list of:
'(Screen-Width Screen-Height Edge-List Buffer-List)

Edge-List is a return value of revive:all-window-edges, list of all
window-edges whose first member is always of north west window.

Buffer-List is a list of buffer property list of all windows.  This
property lists are stored in order corresponding to Edge-List.  Buffer
property list is formed as
'((buffer-file-name) (buffer-name) (point) (window-start)).

\(fn)" nil nil)

(autoload (quote restore-window-configuration) "revive" "\
Restore the window configuration.
Configuration CONFIG should be created by
current-window-configuration-printable.

\(fn CONFIG)" nil nil)

(autoload (quote wipe) "revive" "\
Wipe Emacs.

\(fn)" t nil)

(autoload (quote save-current-configuration) "revive" "\
Save current window/buffer configuration into configuration file.

\(fn &optional NUM)" t nil)

(autoload (quote resume) "revive" "\
Resume window/buffer configuration.
Configuration should be saved by save-current-configuration.

\(fn &optional NUM)" t nil)

;;;***

;;;### (autoloads nil nil ("my-elisp.el" "my-font.el" "my-gdb.el"
;;;;;;  "my-lisp-mode.el" "my-python-mode.el" "my-revive.el" "my-shebang.el"
;;;;;;  "rebox.el" "sgml.el" "tuareg.el") (19773 58850 199598))

;;;***

;;;### (autoloads (c++-mode-setup) "my-c-mode" "my-c-mode.el" (19773
;;;;;;  58776))
;;; Generated autoloads from my-c-mode.el

(autoload (quote c++-mode-setup) "my-c-mode" "\
Not documented

\(fn)" nil nil)

;;;***

(provide 'my-autoload)
