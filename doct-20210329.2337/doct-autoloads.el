;;; doct-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "doct" "doct.el" (0 0 0 0))
;;; Generated autoloads from doct.el

(autoload 'doct-get "doct" "\
Return KEYWORD's value from :doct plist on `org-capture-plist'.
If LOCAL is non-nil, query `org-capture-current-plist' instead.
:doct-custom KEYWORD takes precedence over KEYWORD on the declaration.
Intended to be used at runtime.

\(fn KEYWORD &optional LOCAL)" nil nil)

(autoload 'doct-flatten-lists-in "doct" "\
Flatten each list in LIST. Return recursive accumulator, ACC.
For example: '((1) ((2) (3) (4)) (((5)))) returns: '((1) (2) (3) (4) (5)).

\(fn LIST &optional ACC)" nil nil)

(autoload 'doct "doct" "\
Convert DECLARATIONS to `org-capture-templates'.
DECLARATIONS may be a single declaration or a list of declarations.
Each declaration is either a child, parent, or group.

A child declaration must have:

  - a name
  - a :keys string
  - a template type
  - a target
  - a template

and may also have:

  - hook functions defined with the hook keywords
  - contexts declared via the :contexts keyword
  - additional KEY VAL arguments

A parent declaration must have:

  - a name
  - a :keys string
  - a list of :children

and may also have additional properties inherited by its children.

A group is a special kind of parent declaration.
Its children inherit its properties.
It is not added to the template selection menu.
Its name must be the :group keyword.
It may optionally have a descriptive string for the value of :group.
It must not have a :keys value.

  (doct \\='((\"Work\" :keys \"w\" :file \"~/org/work.org\" :children
         ((:group \"Clocked\" :clock-in t :children
                  ((\"Call\" :keys \"p\" :template \"* Phone call with %?\")
                   (\"Meeting\" :keys \"m\" :template \"* Meeting with %?\")))
          (\"Browsing\" :keys \"b\" :template \"* Browsing %x\")))))

Returns:

  ((\"w\" \"Work\")
   (\"wp\" \"Call\" entry
    (file \"~/org/work.org\") \"* Phone call with %?\" :clock-in t)
   (\"wm\" \"Meeting\"    entry
    (file \"~/org/work.org\") \"* Meeting with %?\"    :clock-in t)
   (\"wb\" \"Browsing\"   entry (file \"~/org/work.org\") \"* Browsing %x\"))

Inherited Properties
====================

A child inherits its ancestors' properties.
It may optionally override an inherited property by specifying that property directly.
For example, considering:

  (doct \\='((\"Grandparent\" :keys \"g\"
              :file \"example.org\"
              :children (\"Parent\" :keys \"p\"
                         :children (\"Child\" :keys \"c\")))))

The \"Child\" template inherits its :file property from the \"Grandparent\" declaration.
The \"Parent\" declaration could override this value:

  (doct \\='((\"Grandparent\" :keys \"g\"
              :file \"example.org\"
              :children (\"Parent\" :keys \"p\"
                         :file \"overridden.org\"
                         :children (\"Child\" :keys \"c\")))))

And the \"Child\" would have its :file property set to \"overridden.org\".

Name & Keys
===========

Every declaration must define a name.
Unless it is a group, it must also define a :keys value.
The name is the first value in the declaration.
The :keys keyword defines the keys to access the template from the capture menu.

  (doct \\='((\"example\" :keys \"e\"...)))

  returns:

  ((\"e\" \"example\"...))

Type
====

The :type keyword defines the template's entry type and accepts the following symbols:

  - entry
    An Org node with a headline.
    The template becomes a child of the target entry or a top level entry.

  - item
    A plain list item, placed in the first plain list at the target location.

  - checkitem
    A checkbox item.
    Same as plain list item only it uses a different default template.

  - table-line
    A new line in the first table at target location.

  - plain
    Text inserted as is.

`doct-default-entry-type' defines the entry type when the :type keyword is not provided.

For example, with `doct-default-entry-type' set to entry (the default):

  (doct \\='((\"example\"
              :keys \"e\"
              :type entry
              :file \"\")))

  and:

  (doct \\='((\"example\"
              :keys \"e\"
              :file \"\")))

  both return:

  ((\"e\" \"example\" entry (file \"\") nil))

Target
======

The target defines the location of the inserted template text.

The first keyword declared in the following group exclusively sets the target.
The :file keyword is not necessary for these.

  - :id \"id of existing Org entry\"
    File as child of this entry, or in the body of the entry
    (see `org-id-get-create')

  - :clock t
    File to the currently clocked entry

  - :function (lambda () ;visit file and move point to desired location...)
    This keyword is exclusive when used without the :file keyword.
    It is responsible for finding the proper file and location to insert the capture item.
    If :file defines a target file, then the function is only responsible for moving point to the desired location within that file.

  (doct \\='((\"example\"
              :keys \"e\"
              :type entry
              :clock t
              ;;ignored because :clock is first
              :function (lambda () (ignore))
              ;;also ignored
              :id \"1\")))

  returns:

  ((\"e\" \"example\" entry (clock) nil))

The :file keyword defines the target file for the capture template.

  (doct ... :file \"/path/to/target.org\")

It may be:

  - a string:

  (doct ... :file \"/path/to/target.org\")
  ;;empty string defaults to `org-default-notes-file'
  (doct ... :file \"\")

  - a function:

  ;;lambda
  (doct ... :file (lambda () (concat (read-string \"Org Capture Path: \") \".org\")))
  ;;or a function symbol
  (doct ... :file my/get-file-path)

  - or a variable:

  (doct ... :file my/file-path)

The following keywords refine the target file location:

  - :headline \"node headline\"
    File under unique heading in target file.

  - :olp (\"Level 1 heading\" \"Level 2 heading\"...)
    Define the full outline in the target file.

  - :datetree nil|t
    Requires use of the :file keyword.
    If :datetree has a non-nil value, create a date tree for today's date.
    Use a non-nil :time-prompt property to prompt for a different date.
    Set the :tree-type property to the symbol 'week' to make a week tree instead of the default month tree.

  - :regexp \"regexp describing location\"
    File to entry matching regexp in target file

  - :function location-finding-function
    If used in addition to the :file keyword, the value should be a function that finds the desired location in that file.
    If used as an exclusive keyword (see above), the function must locate both the target file and move point to the desired location.

Template
========

The :template keyword defines the template for creating the capture item.
It may be either a string, list of strings, or a function.
doct joins the list with new lines.
A function must return the template text.

  (doct \\='((... :template (\"Test\" \"One\" \"Two\"))))

  returns:

  ((... \"Test\\nOne\\nTwo\"))

The :template-file keyword defines a file containing the text of the template.

The first keywords declared overrides any additional template declarations.

Additional Options
==================

Key-value pairs define additional options.

  (doct \\='((... :immediate-finish t)))

  returns:

  ((... :immediate-finish t))

see `org-capture-templates' for a full list of additional options.

Custom data
===========

doct stores unrecognized keywords on the template's `org-capture-plist' as members of the doct-custom plist.
This makes a template's metadata accessible during capture.
See \"%{KEYWORD} Expansion\" below for detail on using that data.

The :custom keyword accepts a plist.
The doct-custom plist stores its elements.
This is only necessary if you wish to use a keyword which doct already uses.
For example:
  (doct \\='((\"Music Gear\" :keys \"m\" :file \"\"
           :custom (:keys \"Moog\")))

returns:

  (\"m\" \"Music Gear\" entry (file \"\") nil :doct-custom (:keys \"Moog\"))

Children
========

The :children keyword defines a parent's children.
Its value may be a single declaration or a list of declarations.
The parent's :keys prefix each child's :keys.

  (doct \\='((\"parent\" :keys \"p\"
              :children
              ((\"child\" :keys \"c\"
                :children
                ((\"grandchild\" :keys \"g\"
                  :file \"\"
                  :type plain
                  :template \"test\")))))))

  returns:

  ((\"p\" \"parent\")
   (\"pc\" \"child\")
   (\"pcg\" \"grandchild\" plain (file \"\") \"test\"))

%{KEYWORD} Expansion
======================

A declaration :template may include a keyword's value during capture.
The syntax is similar to other, built-in \"%-escapes\":

  %{KEYWORD}

will insert the value declared with :KEYWORD in the template.
For example, with:

  (doct \\='((\"Parent\" :keys \"p\"
           :file \"\"
           :template \"* %{todo-state} %?\"
           :children ((\"One\" :keys \"1\" :todo-state \"TODO\")
                      (\"Two\" :keys \"2\" :todo-state \"IDEA\")))))

Each child template has its :todo-state value expanded in the inherited :template.

Values should be strings, functions or nil.

  (doct \\='((\"%{string}\" :keys \"s\" :type plain :file \"\"
           :string \"string\"
           :template \"%{string}\")))

Is replaced with \"string\".

  (doct \\='((\"%{fn}\" :keys \"f\" :type plain :file \"\"
           :fn (lambda () \"string returned from function\")
           :template \"%{fn}\")))

Is replaced with \"string returned from function\".

  (doct \\='((\"%{nil}\" :keys \"f\" :type plain :file \"\"
           :nil nil
           :template \"%{nil}\")))

Is replaced with the empty string \"\".

Custom keywords take precedence over other declaration keywords.
For example, with:

  (doct \\='((\"Music Gear\" :keys \"m\" :file \"\" :type plain
           :custom (:keys \"Moog\")
           :template \"%{keys}\")))

The \"Music Gear\" template expands to \"Moog\" instead of \"m\".
Nil values expand to an empty string.

Hooks
=====

Adding the following keywords in a declaration adds its value to the appropriate `org-capture' hook.
The value may be a function or a variable.

  - :hook
    `org-capture-mode-hook'
  - :prepare-finalize
    `org-capture-prepare-finalize-hook'
  - :before-finalize
    `org-capture-before-finalize-hook'
  - :after-finalize
    `org-capture-after-finalize-hook'

For example:

  (doct \\=`((\"example\"
           :keys \"e\"
           :file \"\"
           :hook ,(defun my/fn ()
                   (ignore)))))

runs my/fn during the `org-capture-mode-hook' when selecting the \"example\" template.

Contexts
========

The :contexts keyword defines contextual rules for a template.
Its value may be a single contextual rule or a list of rules.
The following keywords are available to create contextual rules:

  - :in-buffer regexp
    Show template when REGEXP matches the current buffer's name.

    (doct \\='((\"Only in *scratch*\" :keys \"n\" :file \"\"
             :contexts ((:in-buffer \"^*scratch*$\")))))

  - :unless-buffer regexp
    Show template unless REGEXP matches the current buffer's name.

    (doct \\='((\"Except in *scratch*\" :keys \"n\" :file \"\"
             :contexts ((:unless-buffer \"^*scratch*$\")))))

  - :in-file regexp
    Show template when REGEXP matches the current buffer's file name.

    (doct \\='((\"Only in work.org\" :keys \"n\" :file \"\"
             :contexts ((:in-file \"work\\.org$\")))))

  - :unless-file regexp
    Show template unless REGEXP matches the current buffer's file name.

    (doct \\='((\"Except in work.org\" :keys \"n\" :file \"\"
             :contexts ((:unless-file \"work\\.org$\")))))

  - :in-mode regexp
    Show template when REGEXP matches the current buffer's major mode.

    (doct \\='((\"Only in org-mode\" :keys \"n\" :file \"\"
             :contexts ((:in-mode \"org-mode\")))))

  - :unless-mode regexp
    Show template unless REGEXP matches the current buffer's major mode.

    (doct \\='((\"Except in org-mode\" :keys \"n\" :file \"\"
             :contexts ((:unless-mode \"org-mode\")))))

  - :when condition
    Show template when condition evaluates to a non-nil value.
    Condition may be a function or a single form.

    (doct \\='((\"Show when my/predicate-p returns t\" :keys \"n\" :file \"\"
             :contexts ((:when my/predicate-p)))))

    (doct \\='((\"1/3 chance of showing\" :keys \"n\" :file \"\"
             :contexts ((:when (= 2 (random 3)))))))

  - :unless condition
    Show template when condition evaluates to a nil value.
    Condition may be a function or a single form.

    (doct \\='((\"Show when my/predicate-p returns nil\" :keys \"n\" :file \"\"
             :contexts ((:unless my/predicate-p)))))

    (doct \\='((\"2/3 chance of showing\" :keys \"n\" :file \"\"
             :contexts ((:unless (= 2 (random 3)))))))

  - :function
    Show template when function returns non-nil.
    The function is not passed any arguments.

    (doct \\='((\"Between 9AM and 5PM\" :keys \"n\" :file \"\"
             :contexts
             ((:function (lambda ()
                           (<= 9
                               (string-to-number (format-time-string \"%H\"))
                               17)))))))

Adding :keys to a rule does the same as above, but remaps the template's keys to the template with keys matching the :keys string.
For example:

  (doct \\='((\"In *scratch* remapped to t, else use original template\"
           :keys \"n\" :file \"\"
           :contexts ((:unless-buffer \"^\\*scratch\\*$\" :keys \"n\")
                      (:in-buffer     \"^\\*scratch\\*$\" :keys \"t\")))))

Rule keywords, spare :function, :when, and :unless may also take a list of strings for their values.

  (doct \\='((\"Only in org-mode or emacs-lisp-mode\" :keys \"n\" :file \"\"
           :contexts ((:in-mode (\"org-mode\" \"emacs-lisp-mode\"))))))

Disabling Templates
===================

Setting the :disabled keyword to t disables a template.
The template's declaration is not error checked.
This can be useful if you don't have the time to deal with an error right away.
For example:

  (doct \\='((:group \"All\" :file \"\" :children
                  ((:group \"Enabled\" :children
                           ((\"One\"   :keys \"1\")
                            (\"Two\"   :keys \"2\")
                            (\"Three\" :keys \"3\")))
                   (:group \"Disabled\" :disabled t :children
                           ((\"Four\" :keys 4)
                            (\"Five\" :keys 5)
                            (\"Six\"  :keys 6)))))))

returns:

  ((\"1\" \"One\"   entry (file \"\") nil)
   (\"2\" \"Two\"   entry (file \"\") nil)
   (\"3\" \"Three\" entry (file \"\") nil))

Normally template \"Four\" would throw an error because its :keys are not a string.

\(fn DECLARATIONS)" nil nil)

(autoload 'doct-add-to "doct" "\
Return copy of LIST with converted DECLARATIONS added.
If APPEND is non-nil, add to back of LIST.
Otherwise, add to front.

\(fn LIST DECLARATIONS &optional APPEND)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doct" '("doct-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; doct-autoloads.el ends here
