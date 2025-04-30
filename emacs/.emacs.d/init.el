

(load "~/.emacs.d/rc.el")
(load "~/.emacs.d/mylisp.el")


(setq backup-directory-alist '(("." . "~/.emacs.d/saves/"))
      inhibit-startup-screen t
      backup-inhibited t
      scroll-margin 7
      compilation-read-command t
      use-dialog-box nil
      display-line-number-width nil
      custom-file "~/.emacs.d/junk/emacs-custom.el"
      savehist-file "~/.emacs.d/junk/savehist"
      auto-save-default nil
      create-lockfiles nil
      display-line-numbers-type 'relative
      display-line-numbers 'relative
      display-line-numbers-current-absolute t
      tab-width 2
      )


(defalias 'yes-or-no-p 'y-or-n-p)
(savehist-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(load custom-file)
(save-place-mode 1)
(global-auto-revert-mode 1)

;; (rc/require-theme 'gruber-darker)
(load-theme 'gruvbox-dark-hard)
(set-frame-parameter nil 'alpha-background 90)
;; (set-background-color "#000000")
(set-face-attribute 'default (selected-frame) :height 140 :font "Iosevka Nerd Font-14")
(set-fontset-font t 'khmer "Khmer OS Siemreap-12")

(global-set-key ")" #'my/smart-paren)
(global-set-key "]" #'my/smart-square-brace)
(global-set-key "}" #'my/smart-brace)
(global-set-key  "\"" #'my/smart-quote-double)
(global-set-key (kbd "M-p") 'my/move-text-up)
(global-set-key (kbd "M-n") 'my/move-text-down)


;; multiple cursors
(rc/require 'multiple-cursors)
;;(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-.") 'mc/mark-next-like-this)

;; ;; smex
;; (ido-mode 1)
;; (rc/require 'smex)
;; (global-set-key (kbd "M-x") 'smex)
;; (setq ido-use-filename-at-point 'guess)


;; yasnippet
(rc/require 'yasnippet)
(yas-global-mode 1)
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<backtab>") yas-maybe-expand)
(define-key yas-minor-mode-map (kbd "C-SPC") yas-maybe-expand)

;; latex
(rc/require 'auctex)
(require 'latex)
(setq-default TeX-engine 'xetex)
(setq lsp-latex-server 'texlab
      TeX-auto-save t
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
(add-to-list 'TeX-expand-list
             '("%sn" (lambda () server-name)))
(add-to-list 'TeX-expand-list
             '("%sn" (lambda () server-name)))
(add-to-list 'TeX-view-program-list
             '("Zathura"
               ("zathura %o"
                (mode-io-correlate " --synctex-forward %n:0:\"%b\" -x \"emacsclient --socket-name=%sn +%{line} %{input}\""))
               "zathura"))
(setcar (cdr (assoc 'output-pdf TeX-view-program-selection)) "Zathura")
(keymap-set LaTeX-mode-map "$" 'my/latex-smart-dollar)
(keymap-set LaTeX-mode-map "[" 'my/latex-smart-displaymath)

;; company
(rc/require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0
      company-minimum-prefix-length 2
      company-selection-wrap-around t
      company-format-margin-function nil)

;; lsp
(rc/require 'lsp-mode)
(setq lsp-diagnostic-package :none
      lsp-headerline-breadcrumb-enable nil
      lsp-eldoc-enable-hover nil)
(add-hook 'LaTeX-mode-hook #'lsp)
(add-hook 'latex-mode-hook #'lsp)
(add-hook 'python-mode-hook #'lsp)
(add-hook 'c-mode-hook #'lsp)
(add-hook 'lsp-mode-hook
          (lambda ()
            (define-key lsp-mode-map (kbd "C-c r") 'lsp-rename)))


;; org mode
(rc/require 'org-bullets)
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook 'org-bullets-mode)

;; magit
(rc/require 'magit)

;; sage math
(rc/require 'sage-shell-mode)

;; projectile
(rc/require 'projectile)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)




(set-face-attribute 'fringe nil :background nil)
(add-hook 'window-configuration-change-hook
	  (lambda ()(set-window-margins
		     (car (get-buffer-window-list (current-buffer) nil t)) 2 0)))

(rc/require 'feebleline)
(feebleline-mode 1)

(rc/require 'easy-hugo)
(setq easy-hugo-basedir "~/doc/learn/hugo/")
(setq easy-hugo-url "https://sivmeng.com")

(rc/require 'evil)
(rc/require 'ivy)
(rc/require 'swiper)
(rc/require 'counsel)
(rc/require 'marginalia)
(marginalia-mode)
(keymap-global-set "C-S-s" #'swiper-isearch)
(evil-mode 1)
(ivy-mode)
(keymap-global-set "M-x" #'counsel-M-x)
(keymap-global-set "C-x C-f" #'counsel-find-file)

;; (global-set-key (kbd "C-x C-d") 'dired-jump)


(setq dired-listing-switches "-agho --group-directories-first")
(setq evil-default-state 'emacs)

(rc/require 'which-key)
(which-key-mode)

(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-S-o")
		(lambda ()
		  (interactive)(move-end-of-line 1)(electric-newline-and-maybe-indent)))



;;(rc/require 'vterm)



;; games

;;(require 'keywiz)
