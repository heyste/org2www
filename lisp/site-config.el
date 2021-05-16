;;; package --- Summary
;;; Org-static variables
;;; commentary:
;;; config required settings to have a reasonable looking static web site

(setq org-static-blog-posts-directory (getenv "SITE_POSTS"))
(setq org-static-blog-drafts-directory (getenv "SITE_DRAFTS"))
(setq org-static-blog-publish-directory (getenv "SITE_PUBLISH"))
(setq org-static-blog-publish-url (getenv "SITE_URL"))
(setq org-static-blog-publish-title (getenv "SITE_TITLE"))

(setq org-static-blog-enable-tags t)
(setq org-export-with-toc nil)
(setq org-export-with-section-numbers nil)

(setq org-static-blog-page-header
  (concat "<meta name=\"author\" content=\"" (getenv "SITE_AUTHOR") "\">
  <meta name=\"referrer\" content=\"no-referrer\">
  <link href= \"/static/css/fontawesome.min.css\" rel=\"stylesheet\" type=\"text/css\" />
  <link href= \"/static/css/blog-banner.css\" rel=\"stylesheet\" type=\"text/css\" />
  <link href= \"/static/css/floating-toc.css\" rel=\"stylesheet\" type=\"text/css\" />
  <link href= \"/static/css/usual-org-front-matter.css\" rel=\"stylesheet\" type=\"text/css\" />
  <link href= \"/static/css/org-notes-style.css\" rel=\"stylesheet\" type=\"text/css\" />
  <script src=\"https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.8.2/dist/alpine.min.js\" defer></script>"))

(with-temp-buffer
  (insert-file-contents "page/preamble.html")
  (setq page-preamble (buffer-string)))
(setq org-static-blog-page-preamble page-preamble)

(with-temp-buffer
  (insert-file-contents "page/postamble.html")
  (setq page-postamble (buffer-string)))
(setq org-static-blog-page-postamble page-postamble)

(setq org-static-blog-index-front-matter "<h1>Org Notes</h1>\n")

(with-temp-buffer
  (insert-file-contents "page/front-matter.html")
  (setq page-front-matter (buffer-string)))
(setq org-static-blog-index-front-matter page-front-matter)

(setq org-static-blog-index-length 0)
(setq org-static-blog-rss-file "feed.xml")
