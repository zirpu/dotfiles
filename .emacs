;;
(global-unset-key (kbd "C-z"))

(setq load-path (append (list "~/.emacs.d/lisp" ) load-path))

(load-library "allan-org-mode")
(load-library "allan-mh-stuff")

;; Visual feedback on selections
(setq-default transient-mark-mode t)
;; Always end a file with a newline
(setq require-final-newline t)

;; Stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;; Enable wheelmouse support by default
(cond (window-system
       (mwheel-install)
))

(setq auto-save-list-file-prefix "~/.emacs.d/.saves/.saves-")

(setq auto-save-default t)
(setq inhibit-startup-message t)
(setq-default over-write nil)
(setq version-control t)
(setq kept-old-versions 40)
(setq kept-new-versions 40)

(global-set-key "\C-c#" 'comment-region)

;; for dired mode to list "correctly", or at least the way i'm habituated to.
(setenv "LC_COLLATE" "C")

(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-18"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(default-input-method "rfc1345")
 '(dired-listing-switches "-l")
 '(frame-background-mode nil)
 '(global-font-lock-mode t nil (font-lock))
 '(menu-bar-mode nil)
 '(mh-decode-mime-flag t)
 '(org-capture-templates
   (quote
    (("i" "Inbox" entry
      (file+headline "~/org/GTD.org" "Inbox:")
      "* %?
  %i
" :empty-lines-after 1))))
 '(org-todo-keywords
   (quote
    ((sequence "PROCESS" "NEXT" "TODO" "WAITING" "REVIEW" "DEFERRED" "CANCELED" "DONE"))))
 '(python-guess-indent t)
 '(python-indent-guess-indent-offset t)
 '(safe-local-variable-values
   (quote
    ((eval toggle-input-method)
     (eval add-hook
	   (quote before-save-hook)
	   (quote whitespace-cleanup)
	   nil t)
     (code . utf-8)
     (py-indent-offset . 4)
     (config . utf-8)
     (encoding . utf-8))))
 '(save-place t nil (saveplace))
 '(scroll-bar-mode nil)
 '(show-paren-mode t nil (paren))
 '(size-indication-mode t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal)))))
