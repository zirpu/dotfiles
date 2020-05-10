;;;;;;;;;;;;;;;;
;; Org mode

;; from info '1.3 Activation' suggested bindings.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)

;;;;;;;;;;;;;;;;
(defun allan-goto-gtd ()
  (interactive)
  (find-file "~/projects/zirpu/org.git/GTD.org"))
(define-key global-map "\C-c\C-g" 'allan-goto-gtd)

(setq org-archive-location ".archives/%s_archive::")

;; (setq org-agenda-files '("~/projects/zirpu/org.git/GTD.org"))

;; still needed?
;; archive files to be auto saved.
(defun allan-save-archives ()
  (interactive)
  (save-some-buffers t)
  )

(add-hook 'org-archive-hook 'allan-save-archives)
