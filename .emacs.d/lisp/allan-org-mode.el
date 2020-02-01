
;;;;;;;;;;;;;;;;
;; Org mode

;; The following lines are always needed.  Choose your own keys.

(define-key global-map "\C-cc" 'org-capture)

(defun allan-goto-gtd ()
  (interactive)
  (find-file "~/projects/zirpu/org.git/GTD.org"))
(define-key global-map "\C-c\C-g" 'allan-goto-gtd)


;(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)

;(add-hook 'org-mode-hook 'turn-on-font-lock)  ; org-mode buffers only
;(setq org-agenda-include-all-todo t)
;(setq org-enforce-todo-dependencies t)
;;(setq org-log-done 'time)
;(setq org-startup-folded 'content)
(setq org-archive-location ".archives/%s_archive::")

(setq org-agenda-files '("~/projects/zirpu/org.git/GTD.org"))

; archive files to be auto saved.
(defun allan-save-archives ()
  (interactive)
  (save-some-buffers t)
  )

(add-hook 'org-archive-hook 'allan-save-archives)
