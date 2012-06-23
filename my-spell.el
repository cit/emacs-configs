;;------------------------------------------------------------------------------
;; spell settings
;;------------------------------------------------------------------------------

(message "applying spell settings ...")

(setq ispell-local-dictionary-alist
      '(("deutsch"
         "[A-Za-zöäüß]" "[^A-Za-zöäüß]" "[']" nil
         ("-d" "de_DE")
         nil utf-8)
        ("english"
         "[A-Za-z]" "[^A-Za-z]" "[']" nil
         ("-d" "en_US")
         nil utf-8)
        ))

(setq ispell-program-name "hunspell")
(setq ispell-extra-args '("-i" "utf-8"))
(setq ispell-dictionary "deutsch")
(setq ispell-silently-savep t)
(setq ispell-really-hunspell t)
(setq flyspell-issue-message-flag nil)
(setq flyspell-use-meta-tab nil)

(defun fd-switch-dictionary()
  (interactive)
  (let* ((dic ispell-current-dictionary)
    	 (change (if (string= dic "deutsch") "english" "deutsch")))
    (ispell-change-dictionary change)
    (message "Dictionary switched from %s to %s" dic change)
    ))
(global-set-key (kbd "<f6>") 'fd-switch-dictionary)
    

;; change mouse-2 to mouse-3 for correcting words in flyspell
(add-hook 'flyspell-mode-hook
    (lambda () 
       (define-key flyspell-mouse-map (kbd "<mouse-3>") 'flyspell-correct-word) 
       ))

;; spellcheck in LaTex mode
(add-hook `latex-mode-hook `flyspell-mode)
(add-hook `tex-mode-hook `flyspell-mode)
(add-hook `bibtex-mode-hook `flyspell-mode)