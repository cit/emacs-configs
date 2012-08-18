;;------------------------------------------------------------------------------
;; general settings
;;------------------------------------------------------------------------------

(message "applying general settings ...")

;; disable scroll-bar tool-bar and menu-bar
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; set up height and width of emacs
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 96))

;; Enable the Emacs server
(server-start)

;; my email adress
(setq user-mail-address "florian@adamsky.it")

;; set browser according to the GConf configuration system
(setq browse-url-generic-program
      (substring (shell-command-to-string
                  "gconftool-2 -g /desktop/gnome/applications/browser/exec") 0 -1)
      browse-url-browser-function 'browse-url-generic)

;; don't show so many messages on startup
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; make "yes or no" "y or n"
(fset 'yes-or-no-p 'y-or-n-p)

;; why should anyone want to leave emacs? Better confirm that
(setq confirm-kill-emacs 'yes-or-no-p)

;; no bells please
(global-visual-line-mode 1)
(add-hook 'minibuffer-setup-hook (lambda ()
                                   (visual-line-mode -1)))

;; handle .gz files
(auto-compression-mode t)

;; activate visual-line-mode by default
(setq line-move-visual nil)

;; highlight current line
(global-hl-line-mode 1)

;; insert spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; make all backups in a single directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name (concat custom-basedir "backups")))))

;; I don't like a blinky cursor
(blink-cursor-mode 0)

;; enable column numbers mode
(column-number-mode 1)

;; enable better copy/paste with other X11 applications
(setq x-select-enable-clipboard t)

;; Set proper encodings... UTF-8 all the way
(set-language-environment "utf-8")
(prefer-coding-system 'utf-8)

;; show mic-paren
(show-paren-mode 1)

;; set the right make command
(setq compile-command "make clean; make")

;; improve the performance of the display engine (http://bit.ly/oBeyob)
(setq redisplay-dont-pause t)

;; trailing whitespaces is unncecessary
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; automatically indent after a newline
(global-set-key "\r" 'newline-and-indent)

;; making scripts executable on save
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;;------------------------------------------------------------------------------
;; Package Management
;;------------------------------------------------------------------------------

;; set standard directory for elpa
(require 'package)

(setq package-user-dir (concat custom-basedir "elpa/"))
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

;; yasnippet
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat custom-basedir "site-lisp/snippets/"))
(setq yas/prompt-functions '(yas/dropdown-prompt))

;; recent files
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 50)
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

;; Tags
(setq tags-table-list
      (list (concat custom-basedir "tags/")))

;; color-theme
(require 'color-theme)
(setq solarized-italic nil)
(color-theme-solarized-dark)

;;------------------------------------------------------------------------------
;; Window setup
;;------------------------------------------------------------------------------

;; window frame title
(setq frame-title-format "emacs [%b %*%+ %f]")
(setq icon-title-format "emacs [%b]")

;; Toggle between split windows and a single window (https://gist.github.com/3383607)
(defun toggle-windows-split()
  "Switch back and forth between one window and whatever split of
windows we might have in the frame. The idea is to maximize the
current buffer, while being able to go back to the previous split
of windows in the frame simply by calling this command again."
  (interactive)
  (if (not (window-minibuffer-p (selected-window)))
      (progn
        (if (< 1 (count-windows))
            (progn
              (window-configuration-to-register ?u)
              (delete-other-windows))
          (jump-to-register ?u))))
  (my-iswitchb-close))

(define-key global-map (kbd "C-|") 'toggle-windows-split)

;;------------------------------------------------------------------------------
;; Line numbers
;;------------------------------------------------------------------------------

;; ;; show the line number
;; (setq line-number-mode 1)
;; ;; (fringe-mode 0)
;; (setq fringe-mode 1)
;; (global-linum-mode 1)
;; (setq linum-format "%4d ")
;; (setq linum-Foreground "snow3")
;; (setq linum-Background "black")

;; ;; disable linum in certain major-modes
;; (setq linum-disabled-modes-list
;;       '(eshell-mode Man-mode recentf-mode wl-summary-mode compilation-mode term-mode package
;;                     Dired Ibuffer org-mode Help org-agenda-mode Info-mode shell-mode comint-mode
;;                     magit-mode Magit vc-annotate-mode help-mode magit-mode))

;; (defun linum-on ()
;;   (unless (or (minibufferp) (member major-mode linum-disabled-modes-list))
;;     (linum-mode 1)))

;;------------------------------------------------------------------------------
;; Auto-complete
;;------------------------------------------------------------------------------

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             (concat custom-basedir "auto-complete/ac-dict"))
(ac-config-default)

;;------------------------------------------------------------------------------
;; Interactively Do Things (ido-mode)
;;------------------------------------------------------------------------------

(ido-mode t)
(ido-ubiquitous t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)

;;------------------------------------------------------------------------------
;; Smex
;;------------------------------------------------------------------------------

(require 'smex)
(setq smex-save-file (concat custom-basedir "smex.save"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

;;------------------------------------------------------------------------------
;; Additional packages to load
;;------------------------------------------------------------------------------

;; nice config file mode
(require 'generic-x)

;;------------------------------------------------------------------------------
;; pair insertion (skeleton)
;;------------------------------------------------------------------------------

(require 'autopair)
(autopair-global-mode)     ;; enable autopair in all buffers
(setq autopair-autowrap t) ;; that is, I select a word, press ", and
                           ;; automatically it's turned into "word"


(defun goto-match-paren (arg)
  "Go to the matching  if on (){}[], similar to vi style of % "
  (interactive "p")
  ;; first, check for "outside of bracket" positions expected by forward-sexp, etc.
  (cond ((looking-at "[\[\(\{]") (forward-sexp))
        ((looking-back "[\]\)\}]" 1) (backward-sexp))
        ;; now, try to succeed from inside of a bracket
        ((looking-at "[\]\)\}]") (forward-char) (backward-sexp))
        ((looking-back "[\[\(\{]" 1) (backward-char) (forward-sexp))
        (t nil)))

(global-set-key [(control %)] 'goto-match-paren)

;;------------------------------------------------------------------------------
;; Dired
;;------------------------------------------------------------------------------

(setq dired-listing-switches "-lXGh --group-directories-first")

;;------------------------------------------------------------------------------
;; Templates
;;------------------------------------------------------------------------------

(require 'autoinsert)
(auto-insert-mode)
(setq auto-insert-directory (concat custom-basedir "templates/"))
(setq auto-insert-query nil)(setq auto-insert-alist
      '(
        ("\\.java$" . ["class.java" auto-update-header-file])
        ("\\.pl$"   . ["perl.pl"])
        ("\\.org$"  . ["org-note.org"])
        ("\\.pm$"   . ["perl-module.pm" auto-update-header-file])
        ("\\.c$"    . ["c-code.c"])
        ("\\.h$"    . ["cpp-header.h" auto-update-c-source-file])
        ("\\.mxml$" . ["flex.mxml"])
        )
      )
(setq auto-insert 'other)

;; function replaces the string '@@@' by the current file
;; name. You could use a similar approach to insert name and date into
;; your file.

(defun auto-update-header-file ()
  (save-excursion
    (while (search-forward "@@@" nil t)
      (save-restriction
        (narrow-to-region (match-beginning 0) (match-end 0))
        (replace-match (concat (file-name-sans-extension (file-name-nondirectory buffer-file-name)) "") t )
        ))
    )
  )

(defun auto-update-c-source-file ()
      (save-excursion
	;; Replace HHHH with file name sans suffix
	(while (search-forward "HHHH" nil t)
	  (save-restriction
	    (narrow-to-region (match-beginning 0) (match-end 0))
	    (replace-match (upcase (concat (file-name-sans-extension (file-name-nondirectory buffer-file-name)) "_H")) t
			   )
	    ))
	)
        (save-excursion
	;; Replace HHHH with file name sans suffix
	(while (search-forward "AAAA" nil t)
	  (save-restriction
	    (narrow-to-region (match-beginning 0) (match-end 0))
	    (replace-match (concat (file-name-sans-extension (file-name-nondirectory buffer-file-name)) ".h") t
			   )
	    ))
	)
      (save-excursion
	;; Replace @@@ with file name
	(while (search-forward "@@@" nil t)
	  (save-restriction
	    (narrow-to-region (match-beginning 0) (match-end 0))
	    (replace-match (file-name-sans-extension (file-name-nondirectory buffer-file-name)))
	    ))
	)
      (save-excursion
	;; replace DDDD with today's date
	(while (search-forward "DDDD" nil t)
	  (save-restriction
	    (narrow-to-region (match-beginning 0) (match-end 0))
	    (replace-match "")
	    (insert-today)
	    ))
	)
      )
