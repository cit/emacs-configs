;;------------------------------------------------------------------------------
;; C/C++-Mode
;; -----------------------------------------------------------------------------

(message "applying c++ settings ...")

(add-to-list 'auto-mode-alist '("\\.tcc$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cc$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

;; style I want to use in c++ mode
(c-add-style "my-style"
 	     '("stroustrup"
               (fill-column . 80)
               (c-toggle-auto-newline 0)
 	       (c-basic-offset . 4)                   ; indent by four spaces
 	       (c-offsets-alist . ((inline-open . 0)  ; custom indentation rules
 				   (brace-list-open . 0)
 				   (statement-case-open . +)))))

(defun my-c++-mode-hook ()
  (c-set-style "my-style")        ; use my-style defined above
  (c-basic-offset . 4))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

;; Switch easly between implemenation and header file with C-c o. It works for
;; c-mode and c++-mode.
(add-hook 'c-mode-common-hook
          (lambda()
            (local-set-key  (kbd "C-c o") 'ff-find-other-file)))
