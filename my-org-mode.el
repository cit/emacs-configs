;;------------------------------------------------------------------------------
;; Org-Mode
;;------------------------------------------------------------------------------

(message "applying org-mode settings ...")

(require 'org-macs)
(require 'org-agenda)
(require 'remember)

;; folder where all the notes are
(setq org-main-directory "~/Notizen/")

;; hide the stars
(setq org-indent-mode-turns-on-hiding-stars t)

;; The following lines are always needed.  Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)

(add-to-list 'auto-mode-alist '("\\.org\\'"
                                . org-mode))

;; add modules/home/cit/Notizen/phd-journal.org
(add-to-list 'org-modules 'org-odt)

;; my phd journal
(org-remember-insinuate)
(setq org-remember-templates
      '(("Phd Journal" ?j "**** %T %?"
         "/home/cit/Notizen/phd-journal.org" date-tree)))
(global-set-key (kbd "C-c j") 'org-remember)


;; enable org-babel with the following script languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '( (perl . t)
    (ruby . t)
    (sh . t)
    (latex . t)
    (python . t)
    (emacs-lisp . t)
    (gnuplot . t)
    (lisp .t)
    (dot . t)))

;; fontifying code buffers
(setq org-src-fontify-natively t)

;; set org-babel default shell to bash
(setq org-babel-sh-command "/bin/bash")

;; mobileOrg
(setq org-directory org-main-directory)
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-mobile-files (quote ("private.org")))
(setq org-mobile-index-file (concat org-mobile-directory "/index.org"))
(setq org-mobile-inbox-for-pull (concat "/flagged.org"))

;;------------------------------------------------------------------------------
;; org agenda
;;------------------------------------------------------------------------------

;; set folder where my notes life
(setq org-agenda-files (list org-main-directory))

;; don't show the done items in the agenda view
(setq org-agenda-skip-scheduled-if-done t)

;; week agenda view only with the items which belongs to work and phd-project
(setq org-agenda-custom-commands
      '(("w" "Work Week" agenda ""
         ((org-agenda-ndays 7)
          (org-agenda-files (list
                             (concat org-main-directory "work.org")
                             (concat org-main-directory "phd-project.org")))))))

;; I copied these functions from https://gist.github.com/2963337
(defun org-fit-agenda-window ()
  "Fit the window to the buffer size."
  (and (memq org-agenda-window-setup '(reorganize-frame))
       (fboundp 'fit-window-to-buffer)
       (fit-window-to-buffer)))

(defadvice org-agenda-redo (after fit-windows-for-agenda-redo activate)
  "Fit the Org Agenda to its buffer."
  (org-fit-agenda-window))

(defadvice org-agenda (after fit-windows-for-agenda activate)
  "Fit the Org Agenda to its buffer."
  (org-fit-agenda-window))


;;------------------------------------------------------------------------------
;; org latex
;;------------------------------------------------------------------------------
(require 'org-latex)

(setq org-export-latex-listings t)

(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")))
(add-to-list 'org-export-latex-classes
             '("IEEE"
               "\\documentclass[conference]{IEEEtran}"
               ("\\section{%s}" . "\\section*{%s}")))
(add-to-list 'org-export-latex-classes
             '("ACM"
               "\\documentclass[conference]{sig-alternate}"
               ("\\section{%s}" . "\\section*{%s}")))

;;------------------------------------------------------------------------------
;; Development
;;------------------------------------------------------------------------------

(defun org-insert-code-block ()
  "Insert a code block. At the prompt, enter the language which is available.

Completion can be used to insert any language which is loaded in
org-babel-load-lanuages."
  (interactive)
  (setq language (completing-read
   "Code block : "
   (mapcar 'symbol-name
           (mapcar 'car org-babel-load-languages))
   nil nil))
  (insert (concat "#+BEGIN_SRC " language "\n\n"))
  (insert "#+END_SRC")
  (previous-line))
