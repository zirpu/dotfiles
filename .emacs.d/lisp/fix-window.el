;; frame- or window-resizing function
;; from http://dse.livejournal.com/67732.html. Resizes either frame or window
;; to 80 columns. If the window can be sized to 80 columns wide, without 
;; resizing the frame itself, it will resize the window. Otherwise, it will 
;; resize the frame. You can use a prefix argument to specify a 
;; different column width
(defun fix-frame-horizontal-size (width)
  "Set the frame's size to 80 (or prefix arg WIDTH) columns wide."
  (interactive "P")
  (if window-system
      (set-frame-width (selected-frame) (or width 80))
    (error "Cannot resize frame horizontally: is a text terminal")))

(defun fix-window-horizontal-size (width)
  "Set the window's size to 80 (or prefix arg WIDTH) columns wide."
  (interactive "P")
  (enlarge-window (- (or width 80) (window-width)) 'horizontal))

(defun fix-horizontal-size (width)
  "Set the window's or frame's width to 80 (or prefix arg WIDTH)."
  (interactive "P")
  (condition-case nil
      (fix-window-horizontal-size width)
    (error 
     (condition-case nil
     (fix-frame-horizontal-size width)
       (error
    (error "Cannot resize window or frame horizontally"))))))

(global-set-key (kbd "C-x W") 'fix-horizontal-size)

