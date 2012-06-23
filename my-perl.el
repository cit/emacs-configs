;;------------------------------------------------------------------------------
;; Perl-mode
;;------------------------------------------------------------------------------

(message "applying perl settings ...")

(require 'cperl-mode)
(defalias 'perl-mode 'cperl-mode)

(add-to-list 'auto-mode-alist '("\\.p[6lm]$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.pod$" . pod-mode))
(add-to-list 'auto-mode-alist '("\\.tt$" . tt-mode))

(eval-after-load 'cperl-mode
  '(progn
     (define-key cperl-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
     (define-key cperl-mode-map (kbd "C-M-h") 'backward-kill-word)))

;; redefine shortcut C-h f to cperl-perdoc if cperl-mode is loaded
(add-hook 'cperl-mode-hook
          (lambda ()
            (local-set-key (kbd "C-h f") 'cperl-perldoc)))

;; (defun flymake-perl-init ()
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                      'flymake-create-temp-inplace))
;;          (local-file (file-relative-name
;;                       temp-file
;;                       (file-name-directory buffer-file-name))))
;;     (list "perl" (list "-wc " local-file))))


;; (setq flymake-allowed-file-name-masks
;;       (cons '(".+\\.pl$"
;;               flymake-perl-init
;;               flymake-simple-cleanup
;;               flymake-get-real-file-name)
;;             flymake-allowed-file-name-masks))

;; (setq flymake-err-line-patterns
;;       (cons '("\\(.*\\) at \\([^ \n]+\\) line \\([0-9]+\\)[,.\n]"
;;               2 3 nil 1)
;;             flymake-err-line-patterns))


;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(font-lock-comment-face ((t (:foreground "#ef2929" :bold t))))
;;  '(font-lock-keyword-face ((t (:foreground "#729fcf" :bold t :weight bold))))
;;  '(linum ((t (:inherit (shadow default) :foreground "white")))))

 (custom-set-variables
;;   ;; custom-set-variables was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(cperl-close-paren-offset -4)
  '(cperl-continued-statement-offset 4)
;;  '(cperl-electric-keywords t)
;;  '(cperl-electric-linefeed t)
;;  '(cperl-electric-parens t)
;;  '(cperl-hairy nil)
  '(cperl-indent-level 4)
  ;;
  '(cperl-indent-parens-as-block t)
;;  '(cperl-indent-parens-as-block t)
;;  '(cperl-tab-always-indent t))
  )
