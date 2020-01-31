;; frame- or window-resizing function
;; from http://dse.livejournal.com/67732.html. Resizes either frame or window
;; to 80 columns. If the window can be sized to 80 columns wide, without
;; resizing the frame itself, it will resize the window. Otherwise, it will
;; resize the frame. You can use a prefix argument to specify a
;; different column width

; default 132x43
(defun fix-frame-horizontal-size (width)
  "Set the frame's size to 132 (or prefix arg WIDTH) columns wide."
  (interactive "P")
  (if window-system
      (set-frame-width (selected-frame) (or width 132))
    (error "Cannot resize frame horizontally: is a text terminal")))

(defun fix-window-horizontal-size (width)
  "Set the window's size to 143 (or prefix arg WIDTH) columns wide."
  (interactive "P")
  (enlarge-window (- (or width 143) (window-width)) 'horizontal))

(defun fix-horizontal-size (width)
  "Set the window's or frame's width to 143 (or prefix arg WIDTH)."
  (interactive "P")
  (condition-case nil
      (fix-window-horizontal-size width)
    (error
     (condition-case nil
	 (fix-frame-horizontal-size width)
       (error
	(error "Cannot resize window or frame horizontally"))))))

(global-set-key (kbd "C-x W") 'fix-horizontal-size)

;;

(defun fix-frame-vertical-size (height)
  "Set the frame's size to 43 (or prefix arg HEIGHT) columns wide."
  (interactive "P")
  (if window-system
      (set-frame-height (selected-frame) (or height 43))
    (error "Cannot resize frame vertically: is a text terminal")))

(defun fix-window-vertical-size (height)
  "Set the window's size to 43 (or prefix arg HEIGHT) columns wide."
  (interactive "P")
  (enlarge-window (- (or height 43) (window-height)) 'vertical))

(defun fix-vertical-size (height)
  "Set the window's or frame's height to 43 (or prefix arg HEIGHT)."
  (interactive "P")
  (condition-case nil
      (fix-window-vertical-size height)
    (error
     (condition-case nil
	 (fix-frame-vertical-size height)
       (error
	(error "Cannot resize window or frame vertically"))))))

(global-set-key (kbd "C-x H") 'fix-vertical-size)
