;;;***

;;;### (autoloads (elle-log-mode) "elle-log-mode" "elle-log-mode.el"
;;;;;;  (21383 20960 659094 81000))
;;; Generated autoloads from elle-log-mode.el

(autoload 'elle-log-mode "elle-log-mode" "\
Major mode for viewing elle log files

\(fn)" t nil)

;;;***

;;;### (autoloads (turn-on-fci-mode fci-mode) "fill-column-indicator"
;;;;;;  "fill-column-indicator.el" (21074 47689 877686 308000))
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

;;;### (autoloads (flx-ido-mode) "flx-ido" "flx-ido.el" (21316 7916
;;;;;;  614078 46000))
;;; Generated autoloads from flx-ido.el

(defvar flx-ido-mode nil "\
Non-nil if Flx-Ido mode is enabled.
See the command `flx-ido-mode' for a description of this minor mode.")

(custom-autoload 'flx-ido-mode "flx-ido" nil)

(autoload 'flx-ido-mode "flx-ido" "\
Toggle flx ido mode

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (framemove-default-keybindings fm-right-frame fm-left-frame
;;;;;;  fm-up-frame fm-down-frame) "framemove" "framemove.el" (21074
;;;;;;  47689 877686 308000))
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
;;;;;;  (21316 6771 363042 961000))
;;; Generated autoloads from my-c-project.el

(autoload 'c++-project "my-c-project" "\


\(fn INCPATH BUILDPATH BUILDCMD BINARY ARGS)" nil nil)

;;;***

;;;### (autoloads nil "my-compile" "my-compile.el" (22029 25835 745972
;;;;;;  634000))
;;; Generated autoloads from my-compile.el

(autoload 'my-recompile "my-compile" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (insert-fixme) "my-fixme" "my-fixme.el" (21074
;;;;;;  47689 877686 308000))
;;; Generated autoloads from my-fixme.el

(autoload 'insert-fixme "my-fixme" "\


\(fn &optional MSG)" t nil)

;;;***

;;;### (autoloads (toggle-current-window-dedication window-set-width)
;;;;;;  "my-layout" "my-layout.el" (21074 47689 877686 308000))
;;; Generated autoloads from my-layout.el

(autoload 'window-set-width "my-layout" "\


\(fn &optional WIDTH)" t nil)

(autoload 'toggle-current-window-dedication "my-layout" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (my-log-view-mode-setup) "my-log-view-mode" "my-log-view-mode.el"
;;;;;;  (21383 19807 266046 730000))
;;; Generated autoloads from my-log-view-mode.el

(autoload 'my-log-view-mode-setup "my-log-view-mode" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads (python-mode-setup) "my-python-mode" "my-python-mode.el"
;;;;;;  (21528 15884 330420 137000))
;;; Generated autoloads from my-python-mode.el

(autoload 'python-mode-setup "my-python-mode" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads (my-rebox-comment) "my-rebox" "my-rebox.el" (21074
;;;;;;  47689 877686 308000))
;;; Generated autoloads from my-rebox.el

(autoload 'my-rebox-comment "my-rebox" "\


\(fn STYLE)" t nil)

;;;***

;;;### (autoloads (my-rm-set-mark) "my-rect-mark" "my-rect-mark.el"
;;;;;;  (21342 37622 273480 162000))
;;; Generated autoloads from my-rect-mark.el

(autoload 'my-rm-set-mark "my-rect-mark" "\


\(fn FORCE)" t nil)

;;;***

;;;### (autoloads (sh-mode-setup) "my-sh-mode" "my-sh-mode.el" (21074
;;;;;;  47689 877686 308000))
;;; Generated autoloads from my-sh-mode.el

(autoload 'sh-mode-setup "my-sh-mode" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "qml-mode" "qml-mode.el" (22172 45172 284049
;;;;;;  258000))
;;; Generated autoloads from qml-mode.el

(autoload 'qml-mode "qml-mode" "\
Major mode for Qt declarative UI

\(fn)" t nil)

;;;***

;;;### (autoloads (rm-mouse-drag-region rm-kill-ring-save rm-kill-region
;;;;;;  rm-exchange-point-and-mark rm-set-mark rm-example-picture-mode-bindings)
;;;;;;  "rect-mark" "rect-mark.el" (21341 40732 809917 384000))
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

;;;### (autoloads (rtags-diagnostics rtags-clear-diagnostics rtags-stop-diagnostics
;;;;;;  rtags-post-command-hook rtags-restart-tracking-timer rtags-update-current-project
;;;;;;  rtags-fix-fixit-at-point rtags-cycle-overlays-on-screen rtags-is-running
;;;;;;  rtags-clear-diagnostics-overlays rtags-apply-fixit-at-point
;;;;;;  rtags-find-references-current-dir rtags-find-symbol-current-dir
;;;;;;  rtags-find-references-current-file rtags-find-symbol-current-file
;;;;;;  rtags-find-references rtags-find-symbol rtags-rename-symbol
;;;;;;  rtags-guess-function-at-point rtags-find-all-references-at-point
;;;;;;  rtags-find-virtuals-at-point rtags-find-references-at-point
;;;;;;  rtags-find-symbol-at-point rtags-location-stack-reset rtags-location-stack-back
;;;;;;  rtags-location-stack-forward rtags-quit-rdm rtags-print-current-location
;;;;;;  rtags-enable-standard-keybindings rtags-location-stack-jump
;;;;;;  rtags-goto-offset rtags-print-enum-value-at-point rtags-print-dependencies
;;;;;;  rtags-print-cursorinfo rtags-set-current-project rtags-maybe-reparse-file
;;;;;;  rtags-reparse-file rtags-preprocess-file rtags-index-js-file
;;;;;;  rtags-previous-diag rtags-next-diag rtags-previous-match
;;;;;;  rtags-next-match rtags-bury-or-delete) "rtags" "rtags.el"
;;;;;;  (21559 55610 501013 180000))
;;; Generated autoloads from rtags.el

(autoload 'rtags-bury-or-delete "rtags" "\


\(fn)" t nil)

(autoload 'rtags-next-match "rtags" "\


\(fn)" t nil)

(autoload 'rtags-previous-match "rtags" "\


\(fn)" t nil)

(autoload 'rtags-next-diag "rtags" "\


\(fn)" t nil)

(autoload 'rtags-previous-diag "rtags" "\


\(fn)" t nil)

(autoload 'rtags-index-js-file "rtags" "\


\(fn)" t nil)

(autoload 'rtags-preprocess-file "rtags" "\


\(fn &optional BUFFER)" t nil)

(autoload 'rtags-reparse-file "rtags" "\
WAIT-REPARSING : t to wait for reparsing to finish, nil for async (no waiting).
:fixme: add a timeout

\(fn &optional BUFFER WAIT-REPARSING)" t nil)

(autoload 'rtags-maybe-reparse-file "rtags" "\


\(fn &optional BUFFER)" t nil)

(autoload 'rtags-set-current-project "rtags" "\


\(fn)" t nil)

(autoload 'rtags-print-cursorinfo "rtags" "\


\(fn &optional PREFIX)" t nil)

(autoload 'rtags-print-dependencies "rtags" "\


\(fn &optional BUFFER)" t nil)

(autoload 'rtags-print-enum-value-at-point "rtags" "\


\(fn &optional LOCATION)" t nil)

(autoload 'rtags-goto-offset "rtags" "\


\(fn POS)" t nil)

(autoload 'rtags-location-stack-jump "rtags" "\


\(fn BY)" t nil)

(autoload 'rtags-enable-standard-keybindings "rtags" "\


\(fn &optional MAP PREFIX)" t nil)

(autoload 'rtags-print-current-location "rtags" "\


\(fn)" t nil)

(autoload 'rtags-quit-rdm "rtags" "\


\(fn)" t nil)

(autoload 'rtags-location-stack-forward "rtags" "\


\(fn)" t nil)

(autoload 'rtags-location-stack-back "rtags" "\


\(fn)" t nil)

(autoload 'rtags-location-stack-reset "rtags" "\


\(fn)" t nil)

(autoload 'rtags-find-symbol-at-point "rtags" "\
Find the natural target for the symbol under the cursor and moves to that location.
For references this means to jump to the definition/declaration of the referenced symbol (it jumps to the definition if it is indexed).
For definitions it jumps to the declaration (if there is only one) For declarations it jumps to the definition.
If called with a prefix restrict to current buffer

\(fn &optional PREFIX)" t nil)

(autoload 'rtags-find-references-at-point "rtags" "\
Find all references to the symbol under the cursor
If there's exactly one result jump directly to it.
If there's more show a buffer with the different alternatives and jump to the first one if rtags-jump-to-first-match is true.
References to references will be treated as references to the referenced symbol

\(fn &optional PREFIX)" t nil)

(autoload 'rtags-find-virtuals-at-point "rtags" "\
List all reimplentations of function under cursor. This includes both declarations and definitions

\(fn &optional PREFIX)" t nil)

(autoload 'rtags-find-all-references-at-point "rtags" "\


\(fn &optional PREFIX)" t nil)

(autoload 'rtags-guess-function-at-point "rtags" "\


\(fn)" t nil)

(autoload 'rtags-rename-symbol "rtags" "\


\(fn)" t nil)

(autoload 'rtags-find-symbol "rtags" "\


\(fn &optional PREFIX)" t nil)

(autoload 'rtags-find-references "rtags" "\


\(fn &optional PREFIX)" t nil)

(autoload 'rtags-find-symbol-current-file "rtags" "\


\(fn)" t nil)

(autoload 'rtags-find-references-current-file "rtags" "\


\(fn)" t nil)

(autoload 'rtags-find-symbol-current-dir "rtags" "\


\(fn)" t nil)

(autoload 'rtags-find-references-current-dir "rtags" "\


\(fn)" t nil)

(autoload 'rtags-apply-fixit-at-point "rtags" "\


\(fn)" t nil)

(autoload 'rtags-clear-diagnostics-overlays "rtags" "\


\(fn)" t nil)

(autoload 'rtags-is-running "rtags" "\


\(fn)" t nil)

(autoload 'rtags-cycle-overlays-on-screen "rtags" "\


\(fn)" t nil)

(autoload 'rtags-fix-fixit-at-point "rtags" "\


\(fn)" t nil)

(autoload 'rtags-update-current-project "rtags" "\


\(fn)" t nil)

(autoload 'rtags-restart-tracking-timer "rtags" "\


\(fn)" t nil)

(autoload 'rtags-post-command-hook "rtags" "\


\(fn)" t nil)

(autoload 'rtags-stop-diagnostics "rtags" "\


\(fn)" t nil)

(autoload 'rtags-clear-diagnostics "rtags" "\


\(fn)" t nil)

(autoload 'rtags-diagnostics "rtags" "\


\(fn &optional RESTART NODIRTY)" t nil)

;;;***

;;;### (autoloads nil nil ("../dev/mmm-mode/mmm-auto.el" "../dev/mmm-mode/mmm-class.el"
;;;;;;  "../dev/mmm-mode/mmm-cmds.el" "../dev/mmm-mode/mmm-compat.el"
;;;;;;  "../dev/mmm-mode/mmm-cweb.el" "../dev/mmm-mode/mmm-defaults.el"
;;;;;;  "../dev/mmm-mode/mmm-mason.el" "../dev/mmm-mode/mmm-mode.el"
;;;;;;  "../dev/mmm-mode/mmm-myghty.el" "../dev/mmm-mode/mmm-noweb.el"
;;;;;;  "../dev/mmm-mode/mmm-region.el" "../dev/mmm-mode/mmm-rpm.el"
;;;;;;  "../dev/mmm-mode/mmm-sample.el" "../dev/mmm-mode/mmm-univ.el"
;;;;;;  "../dev/mmm-mode/mmm-utils.el" "flx.el" "my-elisp.el" "my-font.el"
;;;;;;  "my-lisp-mode.el" "my-shebang.el" "my-templates.el" "rebox.el"
;;;;;;  "sgml.el" "tuareg.el") (22333 40235 151087 868000))

;;;***

;;;### (autoloads nil "my-c-mode" "my-c-mode.el" (22333 39737 574853
;;;;;;  708000))
;;; Generated autoloads from my-c-mode.el

(autoload 'sandbox "my-c-mode" "\
Opens a C++ sandbox in current window.

\(fn)" t nil)

(autoload 'c++-mode-setup "my-c-mode" "\


\(fn)" nil nil)

;;;***

(provide 'my-autoload)
