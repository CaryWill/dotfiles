(defun get-org-link-at-point ()
  "Get the link URL at point in an org-mode buffer, stripping the 'file:' prefix if present."
  (let ((context (org-element-context)))
    (when (eq (car context) 'link)
      (let ((link (org-element-property :raw-link context)))
        (if (string-prefix-p "file:" link)
            (substring link 5)  ; remove the "file:" prefix
          link)))))

(defun to-absolute-path (path)
  "Convert relative PATH to absolute, if necessary."
  (if (file-name-absolute-p path)
      path
    (expand-file-name path)))

(defun open-kitty-split (file-path)
  "Open a file at FILE-PATH in Emacs on a Mac, using the 'open' command."
  (interactive "fOpen file: ") ;; Prompts the user to select a file
  ;; Using shell-command to invoke 'open -a Emacs' with the given file path.
  ;; Note: This assumes 'Emacs' is correctly recognized as an application name by macOS.
  ;; Adjust 'Emacs' if your Emacs application is named differently.
  (shell-command (concat "open " (shell-quote-argument file-path))))

(defun open-with-kitten-icat (path)
  "Open the given PATH with `kitten icat`."
  (let ((absolute-path (to-absolute-path path)))
    (if (file-exists-p absolute-path)
        ; (message absolute-path)
        (open-kitty-split absolute-path)
      (message "File does not exist at %s" absolute-path))))

(defun open-org-link-with-kitten-icat ()
  "Open the link at point with `kitten icat` if it is a file path."
  (interactive)
  (let* ((link (get-org-link-at-point))
         (path (if link (url-unhex-string link))))
    (when path
      (open-with-kitten-icat path))))

(define-key org-mode-map (kbd "C-x v") 'open-org-link-with-kitten-icat)
