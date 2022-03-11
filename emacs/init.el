
;; basic
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)


;; setq
(setq custom-file "~/.emacs.d/emacs_saves.el")
(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(setq backup-inhibited t)

(setq-default tab-width 2)
(setq scroll-conservatively 5)




(set-frame-parameter (selected-frame) 'alpha '(90 . 90))
(set-background-color "black")
(set-face-attribute 'default (selected-frame) :height 140
		    :font "JetBrains Mono")
(set-fontset-font t 'khmer "Khmer OS Siemreap")



;; status line
(set-face-attribute 'mode-line nil
                    :background "#353644"
                    :foreground "white"
                    :box '(:line-width 2 :color "#353644")
                    :overline nil
                    :underline nil)

(set-face-attribute 'mode-line-inactive nil
                    :background "#565063"
                    :foreground "white"
                    :box '(:line-width 2 :color "#565063")
                    :overline nil
                    :underline nil)
;; ------------------------------------------------------------------

;; packages
(require 'package)
(add-to-list 'package-archives
						 '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
	(package-install 'use-package))
(require 'use-package)
;; ------------------------------------------------------------------

;; evil
(use-package evil
	:ensure t
	:config
	(evil-mode)
	(evil-set-undo-system 'undo-tree)
	(setq evil-search-module 'evil-search))

(use-package undo-tree
	:ensure t
	:config
	(global-undo-tree-mode 1))
;; ------------------------------------------------------------------

;; latex
(use-package auctex
	:ensure t
	:defer t
	:hook (LaTeX-mode .
										(lambda ()
											(push (list 'output-pdf "Zathura")
														TeX-view-program-selection))))

(setq font-latex-fontify-script nil)
(setq font-latex-fontify-sectioning 'color)
(setq-default TeX-engine 'xetex)
(setq-default TeX-PDF-mode t)

(setq TeX-electric-sub-and-superscript nil)
;;(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

;;(setq LaTeX-indent-environment-list '(itemize))
;;(setq LaTeX-indent-level 0)
;;(setq LaTeX-item-indent 0)
;;(setq LaTeX-left-right-indent-level 0)
;;(setq TeX-brace-indent-level 0)

;; ---------------------------------------------------

(use-package ivy
	:ensure t
	:config
	(ivy-mode 1))

(use-package yasnippet
	:ensure t
	:config
	(yas-global-mode 1))

(define-key yas-minor-mode-map (kbd "C-SPC") 'yas-expand)
(define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)


;; ---------------------------------------------------


;; completion
(use-package company
	:ensure t
	:config
	(company-mode 1))
(add-hook 'after-init-hook 'global-company-mode)

(setq company-dabbrev-downcase 0)
(setq company-idle-delay 0)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "<tab>") #'company-select-next)
  (define-key company-active-map (kbd "<backtab>") #'company-select-previous))
;; ---------------------------------------------------


;; folding:   NOT Working
(use-package folding
	:ensure t
	:config
	(folding-mode-add-find-file-hook))

(folding-add-to-marks-list 'plain-tex-mode "%==> " "%<==" nil t)
(folding-add-to-marks-list 'plain-TeX-mode "%==> " "%<==" nil t)
(folding-add-to-marks-list 'latex-mode     "%==> " "%<==" nil t)
(folding-add-to-marks-list 'LaTeX-mode     "%==> " "%<==" nil t)
(folding-add-to-marks-list 'tex-mode       "%==> " "%<==" nil t)
(folding-add-to-marks-list 'TeX-mode       "%==> " "%<==" nil t)
;; ---------------------------------------------------


;; magit
(use-package magit
	:ensure t)


;; ---------------------------------------------------

;; TODO
;;
;; 1- electric pair mode
;; 2- yas for sqrt, and no $0
;; 3- math $$
