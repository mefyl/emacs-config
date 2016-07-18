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

;;;### (autoloads nil "my-c-project" "my-c-project.el" (22406 3853
;;;;;;  785010 817000))
;;; Generated autoloads from my-c-project.el

(autoload 'c++-project "my-c-project" "\


\(fn INCPATH BUILDPATH BUILDCMD BINARY ARGS)" nil nil)

;;;***

;;;### (autoloads nil "my-compile" "my-compile.el" (22412 56575 69053
;;;;;;  486000))
;;; Generated autoloads from my-compile.el

(autoload 'my-recompile "my-compile" "\


\(fn)" t nil)

(defconst system-cores-logical (string-to-int (shell-command-to-string "nproc")) "\
number of logical processing unit on this system")

;;;***

;;;### (autoloads nil "my-fixme" "my-fixme.el" (22406 3853 785010
;;;;;;  817000))
;;; Generated autoloads from my-fixme.el

(autoload 'insert-fixme "my-fixme" "\


\(fn &optional MSG)" t nil)

;;;***

;;;### (autoloads nil "my-layout" "my-layout.el" (22406 3853 785010
;;;;;;  817000))
;;; Generated autoloads from my-layout.el

(autoload 'window-set-width "my-layout" "\


\(fn &optional WIDTH)" t nil)

(autoload 'toggle-current-window-dedication "my-layout" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "my-log-view-mode" "my-log-view-mode.el" (22406
;;;;;;  3853 785010 817000))
;;; Generated autoloads from my-log-view-mode.el

(autoload 'my-log-view-mode-setup "my-log-view-mode" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "my-python-mode" "my-python-mode.el" (22406
;;;;;;  3853 785010 817000))
;;; Generated autoloads from my-python-mode.el

(autoload 'python-mode-setup "my-python-mode" "\


\(fn)" nil nil)

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

;;;### (autoloads nil nil ("flx.el" "my-elisp.el" "my-font.el" "my-lisp-mode.el"
;;;;;;  "my-shebang.el" "rebox.el" "sgml.el" "tuareg.el") (22412
;;;;;;  56599 506409 910000))

;;;***

;;;### (autoloads nil "my-c-mode" "my-c-mode.el" (22406 3853 785010
;;;;;;  817000))
;;; Generated autoloads from my-c-mode.el

(autoload 'sandbox "my-c-mode" "\
Opens a C++ sandbox in current window.

\(fn)" t nil)

(autoload 'c++-mode-setup "my-c-mode" "\


\(fn)" nil nil)

;;;***

(provide 'my-autoload)
