;;------------------------------------------------------------------------------
;; eshell settings
;;------------------------------------------------------------------------------

(message "applying eshell settings ...")

(require 'password-cache)

(defun m-eshell-hook ()
  (define-key eshell-mode-map [(control p)] 'eshell-previous-matching-input-from-input)
  (define-key eshell-mode-map [(control n)] 'eshell-next-matching-input-from-input)

  (define-key eshell-mode-map [up] 'previous-line)
  (define-key eshell-mode-map [down] 'next-line))

(add-hook 'eshell-mode-hook 'm-eshell-hook)

(add-hook 'eshell-mode-hook
  '(lambda () (linum-mode 1)))
(setq password-cache-expiry nil)
