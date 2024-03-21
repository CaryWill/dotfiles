; 并且将所有相对路径的图片放到当前目录下的 assets 目录
; 这样你可以直接将导出的 html 或者 md 文件放到 assets 目录进去打包
; 然后就可以导入到yuque中了

(require 'org)
(require 'ox-md)

(defun my-copy-images-to-folder (text backend info)
  "Copy local images references in exported Markdown TEXT to a specified folder."
  (when (eq backend 'md)
    ;; Define the target directory for copied images
    (let ((target-dir "./assets/"))
      ;; Ensure target directory exists
      (unless (file-exists-p target-dir)
        (make-directory target-dir t))
      ;; Process the text for image paths
      (with-temp-buffer
        (insert text)
        (goto-char (point-min))
        ;; Match Markdown image syntax
        (while (re-search-forward "!\\[.*?\\](\\(.*?\\))" nil t)
          (let* ((image-path (match-string 1))
                 (file-name (file-name-nondirectory image-path))
                 (target-path (expand-file-name file-name target-dir)))
            ;; Check if the path is local and file exists
            (when (and (not (string-match "^http" image-path))
                       (file-exists-p image-path))
              ;; Copy file to target directory
              (copy-file image-path target-path t)
              ;; Here you can optionally update the path in the buffer, if you wish to modify the references to the new location
              )))
        ;; Previously here was the call to 'write-file, which has now been removed.
        ))))

;; Add the function to org-export-filter-final-output-functions
(add-to-list 'org-export-filter-final-output-functions 'my-copy-images-to-folder)
