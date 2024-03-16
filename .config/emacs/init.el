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

;; neotree
(add-to-list 'load-path "./neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(helm-ag ivy helm org-roam org-bullets evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'timu-rouge t)

; config
(set-frame-font "JetBrainsMono Nerd Font Mono 14" nil t)
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font Mono 14")

; orgmode
(setq org-startup-with-inline-images t)
(setq org-startup-folded t)
(eval-after-load "org"
  '(require 'ox-md nil t))
(setq org-agenda-files '("~/Library/Mobile Documents/com~apple~CloudDocs/Plain Org/references/"))
(setq org-agenda-text-search-extra-files
      '(agenda-archives
        "~/Library/Mobile Documents/com~apple~CloudDocs/Plain Org/orgroam/"
        "~/Library/Mobile Documents/com~apple~CloudDocs/Plain Org/blog"))
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
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
; add done task time
(setq org-log-done 'time)
(setq org-image-actual-width '600)
; (setq org-image-actual-width nil)
(setq org-default-notes-file "~/Library/Mobile Documents/com~apple~CloudDocs/Plain Org/references/inbox.org")
(setq org-html-head-include-default-style nil)

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

(setq initial-buffer-choice "~/Library/Mobile Documents/com~apple~CloudDocs/Plain Org/references/weekly.org")
(setq inhibit-splash-screen t)

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
;; orgmode export setting
;; html
(setq org-html-head-extra
      "<link rel='stylesheet' href='../assets/orgmode.css' />
       <script src='../assets/orgmode.js'></script>
       <link rel='stylesheet' href='../assets/css/quail.css' />
       <script src='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/highlight.min.js'></script>
       <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/styles/default.min.css'>")
; (setq org-export-preserve-breaks t)

; ---- start ----
; https://chat.openai.com/share/70827a10-f0b0-4115-8d0c-82a731b3a4fa
; i use chatgpt to help me do the converion
; 会给导出的 html 加上 lazy loading
; 并且将所有相对路径的图片放到当前目录下的 assets 目录
; 这样你可以直接将导出的 html 或者 md 文件放进去打包
; 然后就可以导入到yuque中了

(defun copy-files-from-img-tags (html)
  (let* ((org-buffer (current-buffer))
         (default-directory (file-name-directory (buffer-file-name org-buffer)))
         (output-folder (concat default-directory "assets/")))
    (make-directory output-folder t)
    (with-temp-buffer
      (insert html)
      (goto-char (point-min))
      (while (re-search-forward "<img +\\([^>]*?\\)src=\"\\([^\"]+\\)\"\\([^>]*\\)>" nil t)
        (let* ((match-string (match-string 0))
               (img-attrs (match-string 1))
               (img-src (expand-file-name (match-string 2) default-directory)) ;; Get absolute path
               (img-rest (match-string 3)))
          (if (file-name-absolute-p img-src)
              ;; If the image source is relative, copy the image to the output folder and add loading="lazy" attribute
              (progn
                (let ((src-file img-src))
                  (when (file-exists-p src-file)
                    (let ((dest-file (expand-file-name (file-name-nondirectory img-src) output-folder)))
                      (copy-file src-file dest-file t))))))))
      (buffer-string))))

(defun add-lazy-loading-to-img-tags (html)
  "Add loading=\"lazy\" attribute to img tags in the HTML content."
  (with-temp-buffer
    (insert html)
    (goto-char (point-min))
    (while (re-search-forward "<img\\([^>]*\\)>" nil t)
      (replace-match "<img\\1 loading=\"lazy\">"))
    (buffer-string)))

(defun return-modified-html-content (contents backend info)
  "Return HTML content with added lazy loading to img tags."
  (when (eq backend 'html)
    (add-lazy-loading-to-img-tags contents)
    (copy-files-from-img-tags contents)))

(add-to-list 'org-export-filter-final-output-functions 'return-modified-html-content)
; ---- end ----

; add video link - bilibili
; http://endlessparentheses.com/embedding-youtube-videos-with-org-mode-links.html
(defvar bilibili-iframe-format
    ;; You may want to change your width and height.
  (concat "<iframe src=\"%s\&autoplay=0&danmaku=1&high_quality=1\"
          border=\"0\"
          frameborder=\"no\"
          framespacing=\"0\" 
          sandbox=\"allow-top-navigation allow-same-origin allow-forms allow-scripts\"
          scrolling=\"no\">
          </iframe>"))

(org-add-link-type
 "bilibili"
  (lambda (handle)
   (browse-url handle))
 (lambda (path desc backend)
   (cl-case backend
     (html (format bilibili-iframe-format
                   path (or desc "")))
     (latex (format "\href{%s}{%s}"
                    path (or desc "video"))))))

; add video link - youtube
(defvar yt-iframe-format
  ;; You may want to change your width and height.
  (concat "<iframe"
          " src=\"%s\""
          " frameborder=\"0\""
          " allowfullscreen>%s</iframe>"))

(org-add-link-type
 "yt"
 (lambda (handle)
   (browse-url
    (concat ""
            handle)))
 (lambda (path desc backend)
   (cl-case backend
     (html (format yt-iframe-format
                   path (or desc "")))
     (latex (format "\href{%s}{%s}"
                    path (or desc "video"))))))
