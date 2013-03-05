;;------------------------------------------------------------------------------
;; LateX Mode (Auctex)
;;------------------------------------------------------------------------------

(message "applying auctex settings ...")

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;; set the indention level to 4 spaces
(setq-default LaTeX-default-offset 4)

;; scoll automtically with the compilation output
(setq compilation-scroll-output t)

(global-auto-revert-mode t)
;; activate folding automatically when opening a tex file
(add-hook 'LaTeX-mode-hook (lambda () (TeX-fold-mode t)
                             (TeX-fold-buffer)))

;; customize folding behavior for environments
(custom-set-variables '(TeX-fold-env-spec-list
                        '(("[comment]" ("comment"))
                          ("[figure]" ("figure")))))

;; customize folding behavior for macros
(custom-set-variables
 '(TeX-fold-macro-spec-list
   '(("[f]"     ("footnote" "marginpar"))
     ("[c]"     ("cite" "parencite"))
     ("[l]"     ("label"))
     ("[r]"     ("ref" "pageref" "eqref"))
     ("[i]"     ("index" "glossary"))
     ("[1]:||*" ("item"))
     ("..."     ("dots"))
     ("(C)"     ("copyright"))
     ("(R)"     ("textregistered"))
     ("TM"      ("texttrademark"))
     (1 ("part" "chapter" "section" "subsection" "subsubsection" "paragraph" "subparagraph" "part*" "chapter*" "section*" "subsection*" "subsubsection*" "paragraph*" "subparagraph*" "emph" "textit" "textsl" "textmd" "textrm" "textsf" "texttt" "textbf" "textsc" "textup" "ac")))))

;; activate flyspell automatically when entering latex mode
(add-hook 'LaTeX-mode-hook (lambda () (flyspell-mode)))

;; activate latex-math-mode automatically when entering latex mode
(add-hook 'LaTeX-mode-hook (lambda () (LaTeX-math-mode)))

;; create pdf files instead of dvi files
(setq TeX-PDF-mode t)

;; RefTex
(add-hook 'LaTeX-mode-hook (lambda () (turn-on-reftex)))
(setq reftex-plug-into-AUCTeX t)
(setq reftex-use-external-file-finders t)
(setq reftex-external-file-finders
      '(("tex" . "kpsewhich -format=.tex %f")
        ("bib" . "kpsewhich -format=.bib %f")))
(setq reftex-default-bibliography
      (quote
       ("default.bib" "other-default.bib")))

(custom-set-variables
 '(TeX-command-list (quote (("XeLaTeX_SyncteX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil (latex-mode doctex-mode) :help "Run XeLaTeX") ("TeX" "%(PDF)%(tex) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (plain-tex-mode texinfo-mode ams-tex-mode) :help "Run plain TeX") ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX") ("Makeinfo" "makeinfo %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with Info output") ("Makeinfo HTML" "makeinfo --html %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with HTML output") ("AmSTeX" "%(PDF)amstex %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (ams-tex-mode) :help "Run AMSTeX") ("ConTeXt" "texexec --once --texutil %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt once") ("ConTeXt Full" "texexec %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt until completion") ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX") ("View" "%V" TeX-run-discard-or-function nil t :help "Run Viewer") ("Print" "%p" TeX-run-command t t :help "Print the file") ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command) ("File" "%(o?)dvips %d -o %f " TeX-run-command t t :help "Generate PostScript file") ("Index" "makeindex %s" TeX-run-command nil t :help "Create index file") ("Check" "lacheck %s" TeX-run-compile nil (latex-mode) :help "Check LaTeX file for correctness") ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document") ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files") ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files") ("Other" "" TeX-run-command t t :help "Run an arbitrary command") ("Jump to PDF" "%V" TeX-run-discard-or-function nil t :help "Run Viewer"))))
 '(TeX-modes (quote (tex-mode plain-tex-mode texinfo-mode latex-mode doctex-mode)))
)
