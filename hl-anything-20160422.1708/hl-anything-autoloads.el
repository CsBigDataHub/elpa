;;; hl-anything-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "hl-anything" "hl-anything.el" (0 0 0 0))
;;; Generated autoloads from hl-anything.el

(autoload 'hl-configuration "hl-anything" "\
Configuration" t nil)

(autoload 'hl-highlight-thingatpt-global "hl-anything" "\
Toggle global highlight." t nil)

(autoload 'hl-unhighlight-all-global "hl-anything" "\
Remove all global highlights." t nil)

(autoload 'hl-highlight-thingatpt-local "hl-anything" "\
Toggle local highlights in the current buffer." t nil)

(autoload 'hl-unhighlight-all-local "hl-anything" "\
Remove all local highlights in buffer." t nil)

(autoload 'hl-save-highlights "hl-anything" "\
Save highlights in `hl-highlight-save-file' file.

  (:global HL-HIGHLIGHTS                 ;; `hl-highlights'
   :local (FILE . HL-HIGHLIGHTS-LOCAL))  ;; `hl-highlights-local'

You can call `hl-restore-highlights' to revert highlights of last session." t nil)

(autoload 'hl-restore-highlights "hl-anything" "\
Load highligts from `hl-highlight-save-file' file. Before calling this, you 
could call `hl-save-highlights' function." t nil)

(autoload 'hl-global-highlight-on/off "hl-anything" nil t nil)

(defvar hl-highlight-mode nil "\
Non-nil if Hl-Highlight mode is enabled.
See the `hl-highlight-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `hl-highlight-mode'.")

(custom-autoload 'hl-highlight-mode "hl-anything" nil)

(autoload 'hl-highlight-mode "hl-anything" "\
Enable highligt engine to do:
- Show highlight over current line highlight (`hl-line-mode' or 
  `global-hl-line-mode').
- Synchronize global highlights.
- Save highlights before killing Emacs and restore them next time.

If called interactively, enable Hl-Highlight mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(autoload 'hl-find-next-thing "hl-anything" "\
Find regexp forwardly and jump to it." t nil)

(autoload 'hl-find-prev-thing "hl-anything" "\
Find regexp backwardly and jump to it." t nil)

(autoload 'hl-paren-mode "hl-anything" "\
Minor mode to highlight the enclosing parentheses and more.

If called interactively, enable Hl-Paren mode if ARG is positive,
and disable it if ARG is zero or negative.  If called from Lisp,
also enable the mode if ARG is omitted or nil, and toggle it if
ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "hl-anything" '("hl-")))

;;;***

;;;### (autoloads nil nil ("hl-anything-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; hl-anything-autoloads.el ends here
