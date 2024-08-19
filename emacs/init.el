

(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(setq custom-file "~/.emacs.d/emacs-custom.el")
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))
(setq inhibit-startup-screen t)
(setq backup-inhibited t)
(setq scroll-margin 7)
(setq compilation-read-command nil)

(load custom-file)
(load-theme 'atom-one-dark t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(set-frame-parameter nil 'alpha-background 90)
(set-face-attribute 'default (selected-frame)
		    :height 130
                    :font "JetBrains Mono")
(set-fontset-font t 'khmer "Khmer OS Siemreap-13")

(add-hook 'window-configuration-change-hook
	  (lambda ()
	    (set-window-margins
	     (car (get-buffer-window-list (current-buffer) nil t)) 2 2)))


(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (setq evil-default-state 'normal) ;;emacs insert normal visual
  (define-key evil-normal-state-map (kbd "S") 'shell-command)
  )


(use-package ido
  :config
  (ido-mode 1))

(use-package tex
  ;; :ensure auctex
  :config
  (setq TeX-auto-save t
	TeX-parse-self t
	electric-indent-mode t
	font-latex-fontify-sectioning 1
	font-latex-fontify-script nil
	font-latex-fontify-sectioning 'color
	TeX-auto-local nil
	tex-fontify-script nil
	font-latex-slide-title-face nil
	TeX-PDF-mode t
	TeX-source-correlate-mode t
	TeX-source-correlate-start-server t)
  (setq-default TeX-engine 'xetex)
  (add-to-list 'TeX-expand-list
	       '("%sn" (lambda () server-name)))
  (add-to-list 'TeX-view-program-list
	       '("Zathura"
		 ("zathura %o"
		  (mode-io-correlate " --synctex-forward %n:0:\"%b\" -x \"emacsclient --socket-name=%sn +%{line} %{input}\""))
		 "zathura"))
  (setcar (cdr (assoc 'output-pdf TeX-view-program-selection)) "Zathura")
  )


(use-package auctex
  :ensure t
  :defer t
  :hook (LaTeX-mode . my-latex-mode-evil-normal-state-bindings)
  :config
  (defun my-latex-mode-evil-normal-state-bindings ()
    (when (featurep 'evil)
      (evil-define-key 'normal LaTeX-mode-map (kbd "SPC SPC") 'TeX-command-master))))

(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :config
  (company-tng-configure-default)
  :custom
  (company-idle-delay 0)
  (company-minimum-prefix-length 1)
  (company-selection-wrap-around t))



;;https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((LaTeX-mode . lsp)
         (latex-mode . lsp)
	 (python-mode . lsp))
  :commands lsp
  :custom
  (lsp-headerline-breadcrumb-enable nil))


(use-package lsp-latex
  :after lsp-mode
  :ensure t  ;; lsp-latex is not a separate package, it is included in lsp-mode
  :config
  (setq lsp-latex-server 'texlab))


(use-package projectile
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd "SPC f") 'projectile-find-file)
  (define-key evil-normal-state-map (kbd "SPC p") 'projectile-switch-project)
  )

(projectile-mode +1)

(setq projectile-project-search-path '("~/doc/proj/"))
(setq projectile-sort-order 'default)
;; (setq projectile-indexing-method 'native)


(use-package ranger
  :ensure t
  :config
  (ranger-override-dired-mode t)
  (define-key evil-normal-state-map (kbd "SPC d") 'deer)
  )

(use-package yasnippet
  :ensure t
  :defer t
  :config
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  (define-key yas-minor-mode-map (kbd "C-SPC") yas-maybe-expand)
  )
(yas-global-mode 1)

(use-package folding
  :disabled
  :ensure t
  :config
  (folding-add-to-marks-list 'LaTeX-mode "%{{{" "%}}}" nil t)
  (define-key evil-normal-state-map (kbd "F") 'toggle-folding-mode)
  (define-key evil-visual-state-map (kbd "F") 'folding-fold-region)
  (define-key evil-normal-state-map (kbd "TAB") 'folding-toggle-show-hide )
  (defun toggle-folding-mode ()
    "Toggle folding-mode on and off."
    (interactive)
    (if (bound-and-true-p folding-mode)
	(turn-off-folding-mode)
      (turn-on-folding-mode)))
  ;; BUG
  ;; after turn-of-folding-mode, folding-toggle-show-hide still work but wanky
  )



(use-package magit
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd "SPC g") 'magit-status)
  )

(use-package simple-modeline
  :ensure t
  :hook (after-init . simple-modeline-mode))



(setq compilation-read-command t)
(define-key evil-normal-state-map (kbd "SPC c") 'compile)

