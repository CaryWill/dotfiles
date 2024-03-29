;; html
(setq org-html-head-extra
      "<link rel='stylesheet' href='../assets/orgmode.css' />
       <script src='../assets/orgmode.js'></script>
       <link rel='stylesheet' href='../assets/css/quail.css' />
       <script src='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/highlight.min.js'></script>
       <script type='text/javascript' src='https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit'></script>
       <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/styles/default.min.css'>
       <div id='google_translate_element'></div>")

; ---- start ----
; https://chat.openai.com/share/70827a10-f0b0-4115-8d0c-82a731b3a4fa
; i use chatgpt to help me do the converion
; 会给导出的 html 加上 lazy loading
; 并且将所有相对路径的图片放到当前目录下的 assets 目录
; 这样你可以直接将导出的 html 或者 md 文件放到 assets 目录进去打包
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
