;;;***

;;;### (autoloads nil "elisp-format" "elisp-format.el" (0 0 0 0))
;;; Generated autoloads from elisp-format.el

(autoload 'elisp-format-region "elisp-format" "\
Format current region or buffer.
This function will format region from START to END.
Or try to format `defun' around point.

\(fn &optional START END)" t nil)

(autoload 'elisp-format-buffer "elisp-format" "\
Format current buffer.

\(fn)" t nil)

(autoload 'elisp-format-file "elisp-format" "\
Format file with FILENAME.

\(fn FILENAME)" t nil)

(autoload 'elisp-format-file-batch "elisp-format" "\
Format elisp FILENAME.
But instead in `batch-mode'.
If SURPRESS-POPUP-WINDOW is non-nil, don't show output window.

\(fn FILENAME &optional SURPRESS-POPUP-WINDOW)" t nil)

(autoload 'elisp-format-directory "elisp-format" "\
Format recursive elisp files under DIR.

\(fn DIR)" t nil)

(autoload 'elisp-format-directory-batch "elisp-format" "\
Format recursive elisp files under DIR.
But instead in `batch-mode'.
If SURPRESS-POPUP-WINDOW is non-nil, don't show output window.

\(fn DIR &optional SURPRESS-POPUP-WINDOW)" t nil)

(autoload 'elisp-format-dired-mark-files "elisp-format" "\
Format dired mark files.

\(fn)" t nil)

(autoload 'elisp-format-library "elisp-format" "\
Format LIBRARY.

\(fn LIBRARY)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "elisp-format" '("elisp-format-")))

;;;***

;;;### (autoloads nil "elle-log-mode" "elle-log-mode.el" (22406 3853
;;;;;;  784010 817000))
;;; Generated autoloads from elle-log-mode.el

(autoload 'elle-log-mode "elle-log-mode" "\
Major mode for viewing elle log files

\(fn)" t nil)

;;;***

;;;### (autoloads nil "fill-column-indicator" "fill-column-indicator.el"
;;;;;;  (22406 3853 784010 817000))
;;; Generated autoloads from fill-column-indicator.el

(autoload 'fci-mode "fill-column-indicator" "\
Toggle fci-mode on and off.
Fci-mode indicates the location of the fill column by drawing a
thin line (a `rule') at the fill column.

With prefix ARG, turn fci-mode on if and only if ARG is positive.

The following options control the appearance of the fill-column
rule: `fci-rule-column', `fci-rule-width', `fci-rule-color',
`fci-rule-use-dashes', `fci-dash-pattern', `fci-rule-character',
and `fci-rule-character-color'.  For further options, see the
Customization menu or the package file.  (See the latter for tips
on troubleshooting.)

\(fn &optional ARG)" t nil)

(autoload 'turn-on-fci-mode "fill-column-indicator" "\
Turn on fci-mode unconditionally.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "flx-ido" "flx-ido.el" (22406 3853 785010 817000))
;;; Generated autoloads from flx-ido.el

(defvar flx-ido-mode nil "\
Non-nil if Flx-Ido mode is enabled.
See the command `flx-ido-mode' for a description of this minor mode.")

(custom-autoload 'flx-ido-mode "flx-ido" nil)

(autoload 'flx-ido-mode "flx-ido" "\
Toggle flx ido mode

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "framemove" "framemove.el" (22406 3853 785010
;;;;;;  817000))
;;; Generated autoloads from framemove.el

(autoload 'fm-down-frame "framemove" "\


\(fn)" t nil)

(autoload 'fm-up-frame "framemove" "\


\(fn)" t nil)

(autoload 'fm-left-frame "framemove" "\


\(fn)" t nil)

(autoload 'fm-right-frame "framemove" "\


\(fn)" t nil)

(autoload 'framemove-default-keybindings "framemove" "\
Set up keybindings for `framemove'.
Keybindings are of the form MODIFIER-{left,right,up,down}.
Default MODIFIER is 'meta.

\(fn &optional MODIFIER)" t nil)

;;;***

;;;### (autoloads nil "my-c-project" "my-c-project.el" (22508 55112
;;;;;;  995305 350000))
;;; Generated autoloads from my-c-project.el

(autoload 'c++-project "my-c-project" "\


\(fn INCPATH BUILDPATH BUILDCMD BINARY ARGS)" nil nil)

;;;***

;;;### (autoloads nil "my-compile" "my-compile.el" (0 0 0 0))
;;; Generated autoloads from my-compile.el

(autoload 'my-recompile "my-compile" "\


\(fn)" t nil)

(defconst system-cores-logical (string-to-number (shell-command-to-string "nproc")) "\
number of logical processing unit on this system")

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "my-compile" '("my-compilation-hook" "find-" "compilation-files")))

;;;***

;;;### (autoloads nil "my-elisp" "my-elisp.el" (0 0 0 0))
;;; Generated autoloads from my-elisp.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "my-elisp" '("filter" "rbegin" "current-file-name" "cwd" "buffer-empty-p")))

;;;***

;;;### (autoloads nil "my-fixme" "my-fixme.el" (22406 3853 785010
;;;;;;  817000))
;;; Generated autoloads from my-fixme.el

(autoload 'insert-fixme "my-fixme" "\


\(fn &optional MSG)" t nil)

;;;***

;;;### (autoloads nil "my-go-mode" "my-go-mode.el" (0 0 0 0))
;;; Generated autoloads from my-go-mode.el

(autoload 'goimports-before-save "my-go-mode" "\
Add this to .emacs to run goimports on the current buffer when saving:
 (add-hook 'before-save-hook 'goimports-before-save).
Note that this will cause go-mode to get loaded the first time
you save any file, kind of defeating the point of autoloading.

\(fn)" t nil)

(autoload 'go-mode-setup "my-go-mode" "\


\(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "my-go-mode" '("goimports")))

;;;***

;;;### (autoloads nil "my-helpers" "my-helpers.el" (0 0 0 0))
;;; Generated autoloads from my-helpers.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "my-helpers" '("find-next-file")))

;;;***

;;;### (autoloads nil "my-html-mode" "my-html-mode.el" (22494 48687
;;;;;;  198861 613000))
;;; Generated autoloads from my-html-mode.el

(autoload 'html-mode-setup "my-html-mode" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "my-layout" "my-layout.el" (22499 40735 841371
;;;;;;  265000))
;;; Generated autoloads from my-layout.el

(autoload 'window-set-width "my-layout" "\


\(fn &optional WIDTH)" t nil)

(autoload 'toggle-current-window-dedication "my-layout" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "my-lisp-mode" "my-lisp-mode.el" (0 0 0 0))
;;; Generated autoloads from my-lisp-mode.el

(autoload 'lisp-mode-setup "my-lisp-mode" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "my-log-view-mode" "my-log-view-mode.el" (22406
;;;;;;  3853 785010 817000))
;;; Generated autoloads from my-log-view-mode.el

(autoload 'my-log-view-mode-setup "my-log-view-mode" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "my-magit" "my-magit.el" (0 0 0 0))
;;; Generated autoloads from my-magit.el

(autoload 'magit-setup "my-magit" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "my-markdown-mode" "my-markdown-mode.el" (22494
;;;;;;  48608 194866 259000))
;;; Generated autoloads from my-markdown-mode.el

(autoload 'markdown-mode-setup "my-markdown-mode" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "my-python-mode" "my-python-mode.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from my-python-mode.el

(autoload 'python-mode-setup "my-python-mode" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "my-python-project" "my-python-project.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from my-python-project.el

(autoload 'python-project "my-python-project" "\


\(fn BUILDPATH BUILDCMD)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "my-python-project" '("python-project-fi")))

;;;***

;;;### (autoloads nil "my-rebox" "my-rebox.el" (22406 3853 785010
;;;;;;  817000))
;;; Generated autoloads from my-rebox.el

(autoload 'my-rebox-comment "my-rebox" "\


\(fn STYLE)" t nil)

;;;***

;;;### (autoloads nil "my-rect-mark" "my-rect-mark.el" (22406 3853
;;;;;;  785010 817000))
;;; Generated autoloads from my-rect-mark.el

(autoload 'my-rm-set-mark "my-rect-mark" "\


\(fn FORCE)" t nil)

;;;***

;;;### (autoloads nil "my-sh-mode" "my-sh-mode.el" (22406 3853 785010
;;;;;;  817000))
;;; Generated autoloads from my-sh-mode.el

(autoload 'sh-mode-setup "my-sh-mode" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "my-tuareg-mode" "my-tuareg-mode.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from my-tuareg-mode.el

(autoload 'tuareg-mode-setup "my-tuareg-mode" "\


\(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "my-tuareg-mode" '(#("tuareg-switch-mli-ml" 0 20 (face font-lock-function-name-face fontified nil)))))

;;;***

;;;### (autoloads nil "my-yaml-mode" "my-yaml-mode.el" (22444 20603
;;;;;;  165871 372000))
;;; Generated autoloads from my-yaml-mode.el

(autoload 'yaml-mode-setup "my-yaml-mode" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "qml-mode" "qml-mode.el" (22406 3853 785010
;;;;;;  817000))
;;; Generated autoloads from qml-mode.el

(autoload 'qml-mode "qml-mode" "\
Major mode for Qt declarative UI

\(fn)" t nil)

;;;***

;;;### (autoloads nil "rect-mark" "rect-mark.el" (22406 3853 785010
;;;;;;  817000))
;;; Generated autoloads from rect-mark.el
 (define-key ctl-x-map "r\C-@" 'rm-set-mark)
 (define-key ctl-x-map [?r ?\C-\ ] 'rm-set-mark)
 (define-key ctl-x-map "r\C-x" 'rm-exchange-point-and-mark)
 (define-key ctl-x-map "r\C-w" 'rm-kill-region)
 (define-key ctl-x-map "r\M-w" 'rm-kill-ring-save)
 (define-key global-map [S-down-mouse-1] 'rm-mouse-drag-region)

(autoload 'rm-example-picture-mode-bindings "rect-mark" "\
Example rect-mark keyboard and mouse bindings for picture mode.

\(fn)" nil nil)

(autoload 'rm-set-mark "rect-mark" "\
Set mark like `set-mark-command' but anticipates a rectangle.
This arranges for the rectangular region between point and mark
to be highlighted using the same face that is used to highlight
the region in `transient-mark-mode'.  This special state lasts only
until the mark is deactivated, usually by executing a text-modifying
command like \\[kill-rectangle], by inserting text, or by typing \\[keyboard-quit].

With optional argument FORCE, arrange for tabs to be expanded and
for spaces to inserted as necessary to keep the region perfectly
rectangular.  This is the default in `picture-mode'.

\(fn FORCE)" t nil)

(autoload 'rm-exchange-point-and-mark "rect-mark" "\
Like `exchange-point-and-mark' but treats region as a rectangle.
See `rm-set-mark' for more details.

With optional argument FORCE, tabs are expanded and spaces are
inserted as necessary to keep the region perfectly rectangular.
This is the default in `picture-mode'.

\(fn FORCE)" t nil)

(autoload 'rm-kill-region "rect-mark" "\
Like kill-rectangle except the rectangle is also saved in the kill ring.
Since rectangles are not ordinary text, the killed rectangle is saved
in the kill ring as a series of lines, one for each row of the rectangle.
The rectangle is also saved as the killed rectangle so it is available for
insertion with yank-rectangle.

\(fn START END)" t nil)

(autoload 'rm-kill-ring-save "rect-mark" "\
Copies the region like rm-kill-region would but the rectangle isn't killed.

\(fn START END)" t nil)

(autoload 'rm-mouse-drag-region "rect-mark" "\
Highlight a rectangular region of text as the the mouse is dragged over it.
This must be bound to a button-down mouse event.

\(fn START-EVENT)" t nil)

;;;***

;;;### (autoloads nil nil ("flx.el" "my-shebang.el" "rebox.el" "sgml.el")
;;;;;;  (0 0 0 0))

;;;***

;;;### (autoloads nil "my-c-mode" "my-c-mode.el" (0 0 0 0))
;;; Generated autoloads from my-c-mode.el

(autoload 'sandbox "my-c-mode" "\
Opens a C++ sandbox in current window.

\(fn)" t nil)

(autoload 'c++-mode-setup "my-c-mode" "\


\(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "my-c-mode" '("c-" "my-gdb" "insert-")))

;;;***

(provide 'my-autoload)
