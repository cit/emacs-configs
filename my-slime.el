;;------------------------------------------------------------------------------
;; Slime-mode
;;------------------------------------------------------------------------------

(message "applying slime settings ...")

(add-path "vendors/slime")
(require 'slime)

(add-hook 'sldb-mode-hook #'(lambda () (setq autopair-dont-activate t)))
(add-hook 'lisp-mode-hook #'(lambda () (setq autopair-dont-activate t)))
(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
;; Optionally, specify the lisp program you are using. Default is "lisp"
(setq inferior-lisp-program "/usr/bin/sbcl")
(slime-setup)
