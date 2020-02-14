
;; (require 'package) ;; You might already have this line
;; (add-to-list 'package-archives
;;              '("melpa" . "https://melpa.org/packages/"))


(require 'package)

; default:
; ("gnu" . "https://elpa.gnu.org/packages/")

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/")
	     )

(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/")
	     )
