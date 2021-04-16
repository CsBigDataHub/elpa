;;; evil-mc-extras-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "evil-mc-extras" "evil-mc-extras.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from evil-mc-extras.el

(autoload 'evil-mc-extras-mode "evil-mc-extras" "\
Toggle evil multiple cursors extras in a single buffer.

If called interactively, enable Evil-Mc-Extras mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(autoload 'evil-mc-extras-initialize "evil-mc-extras" "\
Enable `evil-mc-extras-mode' in the current buffer." nil nil)

(autoload 'turn-on-evil-mc-extras-mode "evil-mc-extras" "\
Turn on `evil-mc-extras-mode' in the current buffer." t nil)

(autoload 'turn-off-evil-mc-extras-mode "evil-mc-extras" "\
Turn off `evil-mc-extras-mode' in the current buffer." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-mc-extras" '("evil-mc-extras-key-map" "global-evil-mc-extras-mode")))

;;;***

;;;### (autoloads nil "evil-mc-extras-num" "evil-mc-extras-num.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from evil-mc-extras-num.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-mc-extras-num" '("evil-mc-")))

;;;***

;;;### (autoloads nil nil ("evil-mc-extras-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; evil-mc-extras-autoloads.el ends here
