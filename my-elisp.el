;;------------------------------------------------------------------------------
;; Emacs Lisp
;;------------------------------------------------------------------------------

(message "applying elisp settings ...")

;; function which replaces a sexp with its value
(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))
