;; ,----[ ~/.init.el ]
;; |
;; |  actual version :
;; |
;; | "Emacs outshines all other editing software in approximately the
;; | same way that the noonday sun does the stars. It is not just bigger
;; | and brighter; it simply makes everything else vanish."
;; | - Neal Stephenson, "In the Beginning was the Command Line"
;; |
;; `----------------

;;------------------------------------------------------------------------------
;; general settings
;;------------------------------------------------------------------------------

(defun add-path (path)
  (add-to-list 'load-path (concat custom-basedir path)))

(defun load-my-cfg (file)
  (load-file (concat custom-basedir file)))

(setq my-cfg-list '(
                    "my-general.el"
                    "my-functions.el"
                    "my-kbd-shortcuts.el"
                    "my-spell.el"
                    "my-auctex.el"
                    "my-org-mode.el"
                    "my-c-mode.el"
                    "my-perl.el"
                    "my-c++.el"
                    "my-css-html.el"
                    "my-eshell.el"
                    "my-slime.el"
                    "my-gnus.el"
                    "my-elisp.el"
                    ))

(mapc 'load-my-cfg my-cfg-list)
