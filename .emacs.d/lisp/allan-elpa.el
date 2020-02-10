
;; (require 'package) ;; You might already have this line
;; (add-to-list 'package-archives
;;              '("melpa" . "https://melpa.org/packages/"))


(require 'package)

(add-to-list 'package-archives
	     '(
;	       ("gnu" . "https://elpa.gnu.org/packages/")
	       ("melpa" . "http://melpa.org/packages/")
	       ("melpa-stable" . "https://stable.melpa.org/packages/")
	       )
	     t)
