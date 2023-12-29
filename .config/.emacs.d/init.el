;; http://xahlee.info/emacs/emacs/emacs_package_system.html
(when (>= emacs-major-version 24)
  (progn
    ;; load emacs 24's package system.
    (require 'package)
    ;; Add MELPA repository.
    (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))
  (when (< emacs-major-version 27) (package-initialize)))

;; https://emacs.stackexchange.com/questions/73403/install-packages-with-one-command
;; auto install package

(setq
 ;; archives to install packages from
 package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                    ("melpa" . "https://melpa.org/packages/"))
 ;; packages to have installed
 package-selected-packages '(magit))

(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages 'noconfirm)
