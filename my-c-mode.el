;;------------------------------------------------------------------------------
;; C-Mode
;;------------------------------------------------------------------------------

(message "applying c-mode settings ...")

(c-add-style
 "python-new"
 '((indent-tabs-mode . nil)
   (fill-column      . 78)
   (c-toggle-auto-newline 0)
   (c-basic-offset   . 4)
   (c-offsets-alist  . ((substatement-open . 0)
                        (inextern-lang . 0)
                        (arglist-intro . +)
                        (knr-argdecl-intro . +)))
   (c-hanging-braces-alist . ((brace-list-open)
                              (brace-list-intro)
                              (brace-list-close)
                              (brace-entry-open)
                              (substatement-open after)
                              (block-close . c-snug-do-while)))
   (c-block-comment-prefix . "* ")))

(c-add-style
 "javascript"
 '((indent-tabs-mode . nil)
   (fill-column      . 80)
   (c-basic-offset   . 2)
   (c-offsets-alist  . ((substatement-open . 0)
                        (inextern-lang . 0)
                        (arglist-intro . +)
                        (knr-argdecl-intro . +)))
   (c-hanging-braces-alist . ((brace-list-open)
                              (brace-list-intro)
                              (brace-list-close)
                              (brace-entry-open)
                              (substatement-open after)
                              (block-close . c-snug-do-while)))
   (c-block-comment-prefix . "")))

(add-to-list 'c-default-style '(c-mode . "python-new"))
(add-to-list 'c-default-style '(ecmascript-mode . "javascript"))

(defun c-select-style ()
  "Select the C style to use from buffer indentation."
  (save-excursion
    (if (re-search-forward "^\t" 3000 t)
        (c-set-style "python")
      (c-set-style "python-new"))))

(add-hook 'c-mode-hook 'c-select-style)