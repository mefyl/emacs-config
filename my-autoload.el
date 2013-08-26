
;;;### (autoloads nil "column-marker" "column-marker.el" (20588 10683
;;;;;;  749117 116000))
;;; Generated autoloads from column-marker.el

(autoload 'column-marker-1 "column-marker" "\
Highlight a column." t)

;;;***

;;;### (autoloads (turn-on-fci-mode fci-mode) "fill-column-indicator"
;;;;;;  "fill-column-indicator.el" (20893 61622 800263 304000))
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

;;;### (autoloads (framemove-default-keybindings fm-right-frame fm-left-frame
;;;;;;  fm-up-frame fm-down-frame) "framemove" "framemove.el" (19779
;;;;;;  24117 164441 900000))
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

;;;### (autoloads (c++-project) "my-c-project" "my-c-project.el"
;;;;;;  (21019 30724 201076 441000))
;;; Generated autoloads from my-c-project.el

(autoload 'c++-project "my-c-project" "\


\(fn INCPATH BUILDPATH BUILDCMD BINARY ARGS)" nil nil)

;;;***

;;;### (autoloads (insert-fixme) "my-fixme" "my-fixme.el" (19779
;;;;;;  23921 405441 900000))
;;; Generated autoloads from my-fixme.el

(autoload 'insert-fixme "my-fixme" "\


\(fn &optional MSG)" t nil)

;;;***

;;;### (autoloads (toggle-current-window-dedication window-set-width)
;;;;;;  "my-layout" "my-layout.el" (19850 25814 265279 997000))
;;; Generated autoloads from my-layout.el

(autoload 'window-set-width "my-layout" "\


\(fn &optional WIDTH)" t nil)

(autoload 'toggle-current-window-dedication "my-layout" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (python-mode-setup) "my-python-mode" "my-python-mode.el"
;;;;;;  (20892 58257 489820 304000))
;;; Generated autoloads from my-python-mode.el

(autoload 'python-mode-setup "my-python-mode" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads (my-rebox-comment) "my-rebox" "my-rebox.el" (19779
;;;;;;  23921 405441 900000))
;;; Generated autoloads from my-rebox.el

(autoload 'my-rebox-comment "my-rebox" "\


\(fn STYLE)" t nil)

;;;***

;;;### (autoloads (sh-mode-setup) "my-sh-mode" "my-sh-mode.el" (19779
;;;;;;  23921 405441 900000))
;;; Generated autoloads from my-sh-mode.el

(autoload 'sh-mode-setup "my-sh-mode" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil nil ("50magit.el" "magit-key-mode.el" "magit-svn.el"
;;;;;;  "magit-topgit.el" "my-elisp.el" "my-font.el" "my-lisp-mode.el"
;;;;;;  "my-marks.el" "my-position-stack.el" "my-shebang.el" "rebox.el"
;;;;;;  "sgml.el" "tuareg.el") (21019 35599 595554 114000))

;;;***

;;;### (autoloads (c++-mode-setup) "my-c-mode" "my-c-mode.el" (21019
;;;;;;  30690 41075 394000))
;;; Generated autoloads from my-c-mode.el

(autoload 'c++-mode-setup "my-c-mode" "\


\(fn)" nil nil)

;;;***

(provide 'my-autoload)
