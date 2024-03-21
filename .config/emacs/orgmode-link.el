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

; add video link - local 
(defvar local-video-format
  ;; You may want to change your width and height.
  (concat "<video controls preload='false'>"
          "<source src='%s' type='video/mp4'>"
          "</video>"))

(org-add-link-type
 "video"
 (lambda (handle)
   (browse-url
    (concat ""
            handle)))
 (lambda (path desc backend)
   (cl-case backend
     (html (format local-video-format
                   path (or desc ""))))))

