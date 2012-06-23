;; my emacs config file

;; set path to config files
(setq custom-basedir (expand-file-name "~/.config/emacs/"))

;; load the init file
(load (expand-file-name (concat custom-basedir "/init.el")))

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name (concat custom-basedir "elpa/package.el")))
  (package-initialize))
(put 'narrow-to-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "microsoft" :slant normal :weight bold :height 98 :width normal))))
 '(TeX-fold-unfolded-face ((((class color) (background dark)) nil))))
