;;------------------------------------------------------------------------------
;; general keyboard shortcuts
;;------------------------------------------------------------------------------

(message "applying keyboard shortcuts ...")

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; hippie-expand
(global-set-key "\M- " 'hippie-expand)

;; expand region
(require 'expand-region)
(global-set-key (kbd "C-@") 'er/expand-region)

;; Use Ibuffer for Buffer List
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; indent automatically
(global-set-key (kbd "RET") 'newline-and-indent)

;; set <end> and <home> to normal behaviour
(global-set-key (kbd "<end>") 'end-of-buffer)
(global-set-key (kbd "<home>") 'beginning-of-buffer)

;; go to a specific line
(global-set-key "\M-g" 'goto-line)

;; compile
(global-set-key [f5] 'compile)

;; really useful feature to avoid over-long lines in source code
;;(global-set-key (kbd "<f9>") 'highlight-beyond-fill-column)
;;(global-set-key (kbd "<f8>") 'font-lock-fontify-buffer)

;; keyboard macros
(global-set-key [f7]  'start-kbd-macro)
(global-set-key [f8]  'end-kbd-macro)
(global-set-key [f9]  'call-last-kbd-macro)

;; fullscreen
(defun switch-full-screen ()
  (interactive)
  (shell-command "wmctrl -r :ACTIVE: -btoggle,fullscreen"))
(global-set-key [f11] 'switch-full-screen)

;; make commenting easy ;)
(global-set-key (kbd "M-#") 'comment-dwim)
(global-set-key (kbd "C-#") 'comment-dwim)

;; scroll without moving cursor
(global-set-key (kbd "C-M-<up>") '(lambda () (interactive) (scroll-down 1)))
(global-set-key (kbd "C-M-<down>") '(lambda () (interactive) (scroll-up 1)))
(global-set-key (kbd "M-<up>") '(lambda () (interactive) (scroll-down 5)))
(global-set-key (kbd "M-<down>") '(lambda () (interactive) (scroll-up 5)))

;; zoom text
(global-set-key (kbd "M-+") 'text-scale-adjust)
(global-set-key (kbd "M--") 'text-scale-adjust)
(global-set-key (kbd "M-0") 'text-scale-adjust)

;; set an easy keybinding for switching windows
(global-set-key (kbd "C-<tab>") 'other-window)

;; set the thinkpad browser keys to cycle buffers
(autoload 'cycle-buffer "cycle-buffer" "Cycle forward." t)
(autoload 'cycle-buffer-backward "cycle-buffer" "Cycle backward." t)
(global-set-key [(XF86Back)] 'cycle-buffer-backward)
(global-set-key [(XF86Forward)] 'cycle-buffer)
