; you can use open -a Emacs to open the file-path in emacs
; (shell-command (concat "open -a Emacs " (shell-quote-argument file-path)))

(defun open-current-file-in-external-emacs ()
  "Open the current file in an external Emacs instance."
  (interactive)
  (if (buffer-file-name)
      (let ((file-path (shell-quote-argument (buffer-file-name))))
        (shell-command (concat "open -a Emacs " file-path)))
    (message "This buffer is not associated with a file.")))

;; Bind the function to a key combination, e.g., Ctrl-c o
(global-set-key (kbd "C-c f") 'open-current-file-in-external-emacs)
