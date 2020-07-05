;;

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(global-unset-key (kbd "C-z"))

(setq load-path (append (list "~/.emacs.d/lisp" ) load-path))

(load-library "allan-org-mode")
(load-library "allan-mh-stuff")
(load-library "allan-elpa")
(load-library "allan-magit")
(load-library "allan-elpy")
(load-library "fix-window")

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

(setq-default show-trailing-whitespace t)

(global-set-key "\C-c#" 'comment-region)

;; for dired mode to list "correctly", or at least the way i'm habituated to.
(setenv "LC_COLLATE" "C")

(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-20"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(column-number-mode t)
 '(confirm-kill-emacs (quote y-or-n-p))
 '(current-language-environment "UTF-8")
 '(default-input-method "rfc1345")
 '(dired-listing-switches "-la")
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-folding elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(elpy-rpc-python-command "python3")
 '(frame-background-mode nil)
 '(global-font-lock-mode t nil (font-lock))
 '(menu-bar-mode nil)
 '(mh-decode-mime-flag t)
 '(org-agenda-files (quote ("~/projects/zirpu/org.git/GTD.org")))
 '(org-capture-templates
   (quote
    (("i" "Inbox" entry
      (file+headline "~/projects/zirpu/org.git/GTD.org" "Inbox:")
      "* %?
  %i
" :empty-lines-after 1)
     ("n" "Next Action" entry
      (file+headline "~/projects/zirpu/org.git/GTD.org" "Next Actions:")
      "* %?
  %i")
     ("l" "Log activities,,," entry
      (file+olp+datetree "~/org/GTD.org" "Log:")
      "* %?
 %U
 %i"))))
 '(org-catch-invisible-edits (quote show-and-error))
 '(org-todo-keywords
   (quote
    ((sequence "TODO" "NEXT" "WAITING" "|" "DONE" "WAITING"))))
 '(package-selected-packages
   (quote
    (org-random-todo use-package dockerfile-mode terraform-mode editorconfig toml-mode pipenv elpy cargo browse-kill-ring csv-mode discover folding go-mode graphviz-dot-mode hcl-mode initsplit magit markdown-mode python-info python-pytest python-test pyvenv rust-mode session yaml-mode)))
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
 '(save-place-mode t nil (saveplace))
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
