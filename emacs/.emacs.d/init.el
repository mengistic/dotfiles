

(load "~/.emacs.d/rc.el")
(load "~/.emacs.d/mylisp.el")

(defalias 'yes-or-no-p 'y-or-n-p)
(setq backup-directory-alist '(("." . "~/.emacs.d/junk/"))
      inhibit-startup-screen t
      backup-inhibited t
      scroll-margin 7
      compilation-read-command t
      use-dialog-box nil
      tab-width 2
      vc-follow-symlinks t
      custom-file "~/.emacs.d/junk/emacs-custom.el"
      create-lockfiles nil
      )
(setq-default truncate-lines t)

(auto-save-mode -1)
(savehist-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(load custom-file)
(toggle-scroll-bar -1)
(save-place-mode 1)
(global-auto-revert-mode 1)
(global-subword-mode 1)
(set-face-attribute 'default
		    (selected-frame)
		    :height 140 :weight 'medium'
		    :font "Iosevka Nerd Font-16")
(set-fontset-font t 'khmer "Khmer OS Siemreap-14")

;; theme
(rc/require 'gruvbox-theme)
(load-theme 'modus-vivendi t)
(set-frame-parameter nil 'alpha-background 84)
(set-background-color "#000000")

;; (add-hook 'prog-mode-hook 'display-line-numbers-mode)
;; (add-hook 'latex-mode-hook 'display-line-numbers-mode)
(global-set-key ")" #'my/smart-paren)
(global-set-key "]" #'my/smart-square-brace)
(global-set-key "}" #'my/smart-brace)
(global-set-key  "\"" #'my/smart-quote-double)
(global-set-key (kbd "M-<up>") 'my/move-text-up)
(global-set-key (kbd "M-<down>") 'my/move-text-down)
(global-set-key (kbd "M-[") 'backward-paragraph)
(global-set-key (kbd "M-]") 'forward-paragraph)
(global-set-key (kbd "C-,") (lambda () (interactive)(duplicate-line)(next-line)))
(global-set-key (kbd "C-c C-<return>") 'compile)
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-j") 'join-line)
(global-set-key (kbd "C-c d") 'project-dired)
(global-set-key (kbd "C-c f") 'project-find-file)
;; (global-set-key (kbd "C-S-o")
;; 		(lambda ()
;; 		  (interactive)(move-end-of-line 1)(electric-newline-and-maybe-indent)))


(require 'org)
(require 'project)
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

(rc/require 'magit)
(rc/require 'sage-shell-mode)
(rc/require 'feebleline)(feebleline-mode 1)
(rc/require 'swiper)(keymap-global-set "C-S-s" #'swiper-isearch)
(rc/require 'which-key)(which-key-mode)

;; (rc/require 'marginalia)(marginalia-mode)
;; (rc/require 'eldoc-box)
;; (add-hook 'eglot-managed-mode-hook #'eldoc-box-hover-mode t)
(rc/require 'vertico)
(rc/require 'orderless)

;; new packages
(vertico-mode 1)
(setq completion-styles '(orderless))
(setq vertico-count 5)
(custom-set-faces '(vertico-current ((t (:inherit underline :extend t)))))
(rc/require 'consult)
(global-set-key (kbd "M-y") 'consult-yank-from-kill-ring)
