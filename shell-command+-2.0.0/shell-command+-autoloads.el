;;; shell-command+-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "shell-command+" "shell-command+.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from shell-command+.el

(autoload 'shell-command+ "shell-command+" "\
Intelligently execute string COMMAND in inferior shell.

If COMMAND is prefixed with an absolute or relative path, the
created process will the executed in the specified path.

When COMMAND starts with...
  <  the output of COMMAND replaces the current selection
  >  COMMAND is run with the current selection as input
  |  the current selection is filtered through COMMAND
  !  COMMAND is simply executed (same as without any prefix)

If `shell-command+-use-eshell' is non-nil, and the the first
argument of COMMAND has a defined `eshell'-function, use that.

Inside COMMAND, % is replaced with the current file name.  To
insert a literal % quote it using a backslash.

These extentions can all be combined with one-another.

In case a region is active, `shell-command+' will only work with the region
between BEG and END.  Otherwise the whole buffer is processed.

\(fn COMMAND BEG END)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "shell-command+" '("shell-command+-")))

;;;***

;;;### (autoloads nil nil ("shell-command+-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; shell-command+-autoloads.el ends here
