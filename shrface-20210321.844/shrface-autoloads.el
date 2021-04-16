;;; shrface-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "shrface" "shrface.el" (0 0 0 0))
;;; Generated autoloads from shrface.el

(defsubst shrface-shr-generic (dom) "\
TODO: Improved shr-generic: fontize the sub DOM." (dolist (sub (dom-children dom)) (cond ((stringp sub) (shr-insert sub)) ((not (equal "" (dom-text (dom-by-tag sub 'code)))) (shrface-shr-fontize-dom-child sub '(comment t face shrface-code))) (t (shr-descend sub)))))

(autoload 'shrface-shr-fontize-dom "shrface" "\
Fontize the sub Optional argument TYPES  DOM.

\(fn DOM &rest TYPES)" nil nil)

(autoload 'shrface-shr-fontize-dom-child "shrface" "\
TODO: fontize the sub DOM.
Optional argument TYPES face attributes.

\(fn DOM &rest TYPES)" nil nil)

(autoload 'shrface-shr-add-font "shrface" "\
Fontize the string.
Argument START start point.
Argument END end point.
Argument TYPE face attributes.

\(fn START END TYPE)" nil nil)

(autoload 'shrface-shr-urlify "shrface" "\
Fontize the URL.
Argument START start point.
Argument END the url.

\(fn START URL &optional TITLE)" nil nil)

(autoload 'shrface-bullets-level-string "shrface" "\
Return the bullets in cycle way.
Argument LEVEL the headline level.

\(fn LEVEL)" nil nil)

(autoload 'shrface-imenu-get-tree "shrface" "\
Produce the index for Imenu." nil nil)

(autoload 'shrface-occur "shrface" "\
Use `occur' to find all `shrface-tag-h1' to `shrface-tag-h6'.
`shrface-occur' will disable if variable `shrface-toggle-bullets' is Non-nil." t nil)

(autoload 'shrface-mode "shrface" "\
Toggle shr minor mode.
`shrface-mode' will disable if `shrface-toggle-bullets' is Non-nil.
1. imenu
2. outline-minor-mode
3. org-indent-mode

If called interactively, enable Shrface mode if ARG is positive,
and disable it if ARG is zero or negative.  If called from Lisp,
also enable the mode if ARG is omitted or nil, and toggle it if
ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "shrface" '("shrface-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; shrface-autoloads.el ends here
