;;------------------------------------------------------------------------------
;; general keyboard shortcuts
;;------------------------------------------------------------------------------

(message "applying keyboard shortcuts ...")

(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)

;; hippie-expand
(global-set-key (kbd "M-/") 'hippie-expand)

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
(global-set-key (kbd "M-g") 'goto-line)

;; compile
(global-set-key [f5] 'compile)

;; keyboard macros
(global-set-key [f7] 'start-kbd-macro)
(global-set-key [f8] 'end-kbd-macro)
(global-set-key [f9] 'call-last-kbd-macro)

;; indent whole buffer
(defun indent-whole-buffer ()
  "Indent the whole buffer."
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))
(global-set-key (kbd "C-c i b") 'indent-whole-buffer)

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

;; set keybinding to switch between windows
(global-set-key (kbd "C-x C-n") 'other-window)
(global-set-key (kbd "C-x C-p") '(lambda () (interactive) (other-window -1)))

;; set the thinkpad browser keys to cycle buffers
(autoload 'cycle-buffer "cycle-buffer" "Cycle forward." t)
(autoload 'cycle-buffer-backward "cycle-buffer" "Cycle backward." t)
(global-set-key [(XF86Back)] 'cycle-buffer-backward)
(global-set-key [(XF86Forward)] 'cycle-buffer)
