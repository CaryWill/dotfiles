;;; xwwp-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from xwwp.el

(autoload 'xwwp-browse-url-other-window "xwwp" "\
Ask xwidget-webkit to browse URL.
NEW-SESSION specifies whether to create a new xwidget-webkit session.
Interactively, URL defaults to the string looking like a url around point.

(fn URL &optional NEW-SESSION)" t)
(register-definition-prefixes "xwwp" '("xwwp"))


;;; Generated autoloads from xwwp-follow-link.el

(autoload 'xwwp-follow-link "xwwp-follow-link" "\
Ask for a link in the XWIDGET session or the current one and follow it.

(fn &optional XWIDGET)" t)
(register-definition-prefixes "xwwp-follow-link" '("xwwp-follow-link-"))


;;; Generated autoloads from xwwp-follow-link-ido.el

(register-definition-prefixes "xwwp-follow-link-ido" '("xwwp-follow-link-completion-backend-ido"))

;;; End of scraped data

(provide 'xwwp-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; xwwp-autoloads.el ends here