;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
; (package-refresh-contents)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))
;; Enable Evil
(require 'evil)
(evil-mode 1)
(unless (package-installed-p 'undo-tree)
  (package-install 'undo-tree))
(require 'undo-tree)
(evil-set-undo-system 'undo-tree)
(global-undo-tree-mode 1)
(setq undo-tree-history-directory-alist '(("." . "/tmp")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(pbcopy spacemacs-theme solarized-theme org-bullets evil)))


; (custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ; '(default ((t (:background nil)))))

; theme
(load-theme 'spacemacs-light t)
; (set-face-attribute 'default nil :family "JetBrainsMono Nerd Font" :height 140)

; orgmode
(setq org-startup-with-inline-images t)
(setq org-startup-folded t)
(eval-after-load "org"
  '(require 'ox-md nil t))
(setq org-agenda-files '("~/Library/Mobile Documents/com~apple~CloudDocs/Plain Org/references/"))
; (setq org-agenda-text-search-extra-files
;       '(agenda-archives
;         "~/Library/Mobile Documents/com~apple~CloudDocs/Plain Org/orgroam/"
;         "~/Library/Mobile Documents/com~apple~CloudDocs/Plain Org/blog"))
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
; auto indent
(setq org-adapt-indentation t)
; emacs orgmode do not insert line between headers?
(setf org-blank-before-new-entry '((heading . nil) (plain-list-item . nil)))
; orgmode id link
; see here https://orgmode.org/manual/Activation.html#Activation-1
(setq org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id)
(global-set-key (kbd "C-c l") #'org-store-link)
; C-c C-l 是 insert link
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
; add done task time
(setq org-log-done 'time)
(setq org-image-actual-width '600)
; (setq org-image-actual-width nil)
(setq org-default-notes-file "~/Library/Mobile Documents/com~apple~CloudDocs/Plain Org/references/inbox.org")
(setq org-html-head-include-default-style nil)
(setq org-agenda-span 'month)
; https://orgmode.org/manual/Tracking-TODO-state-changes.html
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w!)" "VERIFY(v!)" "|" "DONE(d!)" "CANCELLED(c!)")))

(setq org-todo-keyword-faces
  '(("WAIT" . "#E35DBF")
    ("CANCELED" . (:foreground "white" :background "#4d4d4d" :weight bold))
    ("VERIFY" . "pink")))
;; write todo state changes into LOGBOOK drawer
(setq org-log-into-drawer "LOGBOOK")

; auto refresh buffer
(global-auto-revert-mode t)

; gui options
(menu-bar-mode -1) 
(when (display-graphic-p)
   (tool-bar-mode -1)
   (scroll-bar-mode -1))

; copy & paste
(unless (package-installed-p 'pbcopy)
  (package-install 'pbcopy))
(require 'pbcopy)
(turn-on-pbcopy)

; org-bullets
(unless (package-installed-p 'org-bullets)
  (package-install 'org-bullets))
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

; backup dir
(setq backup-directory-alist '(("." . "~/tmp")))

; (setq inhibit-startup-screen t
;       initial-buffer-choice  nil)
(setq initial-buffer-choice "~/Library/Mobile Documents/com~apple~CloudDocs/Plain Org/references/work.org")

;; vim keymapping
(define-key evil-normal-state-map (kbd "C-h") #'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") #'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") #'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") #'evil-window-right)

(define-key evil-normal-state-map "j" 'evil-next-visual-line)
(define-key evil-normal-state-map "k" 'evil-previous-visual-line)

(evil-set-leader 'normal (kbd "SPC"))
(evil-define-key 'normal 'global (kbd "<leader>ss") 'split-window-vertically)
(evil-define-key 'normal 'global (kbd "<leader>sv") 'split-window-horizontally)
(evil-define-key 'normal 'global (kbd "<leader>l") 'evil-next-buffer)
(evil-define-key 'normal 'global (kbd "<leader>h") 'evil-prev-buffer)

;; code evaluation
(org-babel-do-load-languages
      'org-babel-load-languages
      '((js . t)))

(setq org-agenda-start-with-follow-mode t)

(setq org-agenda-window-setup 'current-window)

(setq initial-scratch-message "")
(setq inhibit-startup-message t) 
(setq org-use-tag-inheritance nil)
(setq-default line-spacing 5)

(load-file "~/workspace/github/dotfiles/.config/emacs/orgmode-link.el")
(load-file "~/workspace/github/dotfiles/.config/emacs/orgmode-html-export.el")
(load-file "~/workspace/github/dotfiles/.config/emacs/orgmode-md-export.el")
