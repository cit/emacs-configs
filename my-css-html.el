;;------------------------------------------------------------------------------
;; CSS-Mode
;;------------------------------------------------------------------------------

(message "applying css and html settings ...")

;; convert hex colors in colors
(defvar hexcolour-keywords
  '(("#[abcdef[:digit:]]\\{6\\}"
     (0 (put-text-property
         (match-beginning 0)
         (match-end 0)
         'face (list :background
                     (match-string-no-properties 0)))))))
(defun hexcolour-add-to-font-lock ()
  (font-lock-add-keywords nil hexcolour-keywords))

(add-hook 'css-mode-hook 'hexcolour-add-to-font-lock)

(defun tidy-html()
  "Tidies the HTML content in the buffer using 'tidy'"
  (interactive)
  (shell-command-on-region
   (point-min)                          ;; beginning and
   (point-max)                          ;; end of buffer
   "tidy -i -w 120 -q"                  ;; command and parameters
   (current-buffer)                     ;; output buffer
   t                                    ;; replace?
   "*Tidy Error Buffer*"                ;; name of the error buffer
   t))                                  ;; show error buffer?
