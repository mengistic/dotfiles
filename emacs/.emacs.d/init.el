;; https://emacsdocs.org/

(load "~/.emacs.d/rc.el")
(load "~/.emacs.d/mylisp.el")

(setq backup-directory-alist '(("." . "~/.emacs.d/junk/"))
      inhibit-startup-screen t
      backup-inhibited t
      scroll-margin 7
      compilation-read-command t
      use-dialog-box nil
      ;; display-line-number-width nil
      custom-file "~/.emacs.d/junk/emacs-custom.el"
      ;; savehist-file "~/.emacs.d/junk/savehist"
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
(load custom-file)
(toggle-scroll-bar -1)
(save-place-mode 1)
(global-auto-revert-mode 1)
(global-subword-mode 1)
(set-face-attribute 'default (selected-frame) :height 140 :font "Iosevka Nerd Font-14")
(set-fontset-font t 'khmer "Khmer OS Siemreap-12")

;; theme
(rc/require 'gruvbox-theme)
(load-theme 'modus-vivendi t)
(set-frame-parameter nil 'alpha-background 90)
;; (set-background-color "#000000")

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(global-set-key ")" #'my/smart-paren)
(global-set-key "]" #'my/smart-square-brace)
(global-set-key "}" #'my/smart-brace)
(global-set-key  "\"" #'my/smart-quote-double)
(global-set-key (kbd "M-<up>") 'my/move-text-up)
(global-set-key (kbd "M-<down>") 'my/move-text-down)
(global-set-key (kbd "M-[") 'backward-paragraph)
(global-set-key (kbd "M-]") 'forward-paragraph)
(global-set-key (kbd "C-,") 'duplicate-dwim)
(global-set-key (kbd "C-c C-<return>") 'compile)
(global-set-key (kbd "C-S-o")
		(lambda ()
		  (interactive)(move-end-of-line 1)(electric-newline-and-maybe-indent)))

(require 'org)
(require 'project)
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

(rc/require 'magit)
(rc/require 'sage-shell-mode)
(rc/require 'feebleline)(feebleline-mode 1)
(rc/require 'swiper)(keymap-global-set "C-S-s" #'swiper-isearch)
(rc/require 'which-key)(which-key-mode)
(rc/require 'smex) (global-set-key (kbd "M-x") 'smex)

;; === padding at the left
;; (set-face-attribute 'fringe nil :background nil)
;; (add-hook 'window-configuration-change-hook
;; 	  (lambda ()(set-window-margins
;; 		     (car (get-buffer-window-list (current-buffer) nil t)) 2 0)))


;; === Packages to be removed ===
;; (rc/require 'ido-vertical-mode)
;; (ido-vertical-mode 1)
;; (setq ido-use-filename-at-point 'guess)

;; (rc/require 'ivy)
;; (rc/require 'counsel)
;; (rc/require 'marginalia)
;; (marginalia-mode)
;; (evil-mode 1)
;; (ivy-mode)
;; (keymap-global-set "M-x" #'counsel-M-x)
;; (keymap-global-set "C-x C-f" #'counsel-find-file)
;; (rc/require 'evil)
;; ;; smex
;; (rc/require 'god-mode)
;; (rc/require 'surround)
;; (global-set-key (kbd "M-'") 'surround-keymap)
;; (god-mode)
;; (define-key god-local-mode-map (kbd "i") #'god-local-mode)
;; (global-set-key (kbd "<escape>") #'(lambda () (interactive) (god-local-mode 1)))
;; (define-key god-local-mode-map (kbd ".") #'repeat)

;; projectile
;; (rc/require 'projectile)
;; (projectile-mode +1)
;; (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))
;; (plist-put org-format-latex-options :scale 1.5)

