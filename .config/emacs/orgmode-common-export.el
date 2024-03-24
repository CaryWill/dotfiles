; keep the priority
(require 'ox)
(defun my/export-insert-priority-after-todo (backend)
  (org-element-map (org-element-parse-buffer 'headline) 'headline
    (lambda (headline)
      (let ((todo (org-element-property :todo-keyword headline))
            (priority (org-element-property :priority headline))
            (title (org-element-property :raw-value headline)))
        (when (and todo priority)
          ;; Calculate the new title with the priority inserted right after the TODO keyword.
          (let ((new-title (concat todo " [#" (char-to-string priority) "] " title)))
            ;; Replace the headline title with the modified one.
            ;; Note: This replaces the first occurrence of the original title in the headline, which could
            ;; potentially mismatch if the title also appears elsewhere in the headline.
            (goto-char (org-element-property :begin headline))
            ;; Search for the TODO keyword to ensure correct placement.
            (when (re-search-forward (regexp-quote todo) (org-element-property :end headline) t)
              (insert " [#" (char-to-string priority) "]"))))))))

(add-hook 'org-export-before-parsing-hook 'my/export-insert-priority-after-todo)
