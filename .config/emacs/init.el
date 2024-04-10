;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
; (package-refresh-contents)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))
(require 'evil)
(evil-mode 1)
; orgmode tab to org-cycle
(with-eval-after-load 'evil-maps (define-key evil-motion-state-map (kbd "TAB") nil))

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
; (set-face-attribute 'default nil :family "Menlo-16")
; (set-face-attribute 'variable-pitch nil :font "JetBrainsMono Nerd Font-16") ; normal org font
; (set-face-attribute 'default nil :font "Consolas-16") 
; (set-face-attribute 'fixed-pitch nil :font  "Consolas-16") 
; orgmode
(setq org-startup-with-inline-images t)
(setq org-startup-folded t)
(eval-after-load "org"
  '(require 'ox-md nil t))
(setq org-agenda-files '("~/Library/Mobile Documents/com~apple~CloudDocs/Plain Org/references/"))
(setq org-agenda-files (remove "~/Library/Mobile Documents/com~apple~CloudDocs/Plain Org/references/ulysses.org" org-agenda-files))
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
; C-c C-l 是 insert link
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
(global-set-key (kbd "C-c H") 'tab-previous)
(global-set-key (kbd "C-c L") 'tab-next)
; add done task time
(setq org-log-done 'time)
(setq org-image-actual-width '600)
; (setq org-image-actual-width nil)
(setq org-default-notes-file "~/Library/Mobile Documents/com~apple~CloudDocs/Plain Org/references/inbox.org")
(setq org-html-head-include-default-style nil)

; https://orgmode.org/manual/Tracking-TODO-state-changes.html
(setq org-todo-keywords
      '((sequence "TODO(t)" "PROCESSING(p)" "WAIT(w!)" "BLOCK(b!)" "VERIFY(v!)" "RELEASING(r!)" "|" "DONE(d!)" "CANCELLED(c!)")))

(setq org-todo-keyword-faces
  '(("WAIT" . "#E35DBF")
    ("CANCELED" . (:foreground "white" :background "#4d4d4d" :weight bold))
    ("BLOCK" . "red")
    ("RELEASING" . "blue")
    ("PROCESSING" . "gold")
    ("VERIFY" . "pink")))
;; write todo state changes into LOGBOOK drawer
(setq org-log-into-drawer "LOGBOOK")

; auto refresh buffer
(global-auto-revert-mode t)

; gui options
; (menu-bar-mode -1) 
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
; (setq initial-buffer-choice "~/Library/Mobile Documents/com~apple~CloudDocs/Plain Org/references/work.org")

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

;; code evaluation
(org-babel-do-load-languages
      'org-babel-load-languages
      '((js . t)))

(setq org-agenda-start-with-follow-mode t)

;; M-x customize-group org-agenda-windows
;; you can see all the options
;; https://stackoverflow.com/a/10638665
(setq org-agenda-window-setup 'other-tab)

; (setq initial-scratch-message "")
; (setq inhibit-startup-message t) 
(setq org-use-tag-inheritance nil)
(setq-default line-spacing 5)

(load-file "~/workspace/github/dotfiles/.config/emacs/orgmode-link.el")
(load-file "~/workspace/github/dotfiles/.config/emacs/orgmode-html-export.el")
(load-file "~/workspace/github/dotfiles/.config/emacs/orgmode-md-export.el")
(load-file "~/workspace/github/dotfiles/.config/emacs/orgmode-common-export.el")
(load-file "~/workspace/github/dotfiles/.config/emacs/orgmode-open-image.el")
(load-file "~/workspace/github/dotfiles/.config/emacs/orgmode-open-file.el")
(load-file "~/workspace/github/dotfiles/.config/emacs/orgmode-mapping.el")

(setq org-archive-location "~/Library/Mobile Documents/com~apple~CloudDocs/Plain Org/assets/archives/%s_archive::")
(setq org-default-journal "~/Library/Mobile Documents/com~apple~CloudDocs/Plain Org/references/journal.org")

; https://gist.github.com/spacebat/097f3e7469edf2eaa6a9
; https://www.zmonster.me/2018/02/28/org-mode-capture.html#org2d1ad24
; https://orgmode.org/guide/Capture.html
(setq org-capture-templates nil)

(add-to-list 'org-capture-templates
             '("j" "Journal" entry (file org-default-journal)
               "* %U - %^{heading}\n  %?"))

(add-to-list 'org-capture-templates
             '("t" "Task" entry (file+headline "" "Tasks") "* TODO %?\n  %u\n  %a"))

; (add-to-list 'org-capture-templates
;              '("i" "Inbox" entry (file+headline org-default-notes-file "Inbox")
;                "* %U - %^{heading} %?\n"))

(add-to-list 'org-capture-templates
             '("n" "Notes" entry (file org-default-notes-file)
               "* %U - %^{heading}\n  %?"))

; How can I get a ruler at column 80?
; (add-hook 'org-mode-hook #'display-fill-column-indicator-mode)

; hide date if there's no item under that date
(setq org-agenda-show-all-dates nil)
; view next 90 days
; (setq org-agenda-span 90)
(setq org-agenda-span 'month)
; (setq org-agenda-skip-scheduled-if-deadline-is-shown 'repeated-after-deadline)
; (setq org-agenda-skip-deadline-if-done t)
; (setq org-agenda-skip-deadline-prewarning-if-scheduled 'pre-scheduled)
; (setq org-agenda-skip-deadline-if-done 'repeated-after-deadline)
; (setq org-agenda-skip-scheduled-if-done t)
; (setq org-agenda-skip-timestamp-if-done t)

; save emacs layout after quit
(desktop-save-mode 1)
(add-hook 'kill-emacs-hook 'desktop-save-in-desktop-dir)
(add-hook 'after-init-hook 'desktop-read)
