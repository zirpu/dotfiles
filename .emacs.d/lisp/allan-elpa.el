
;; (require 'package) ;; You might already have this line
;; (add-to-list 'package-archives
;;              '("melpa" . "https://melpa.org/packages/"))


(require 'package)
(add-to-list 'package-archives
;             '("melpa" . "http://melpa.org/packages/") t)
             '("melpa-stable" . "https://stable.melpa.org/packages/"))

;; (require 'package)
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(package-initialize)
(elpy-enable)
