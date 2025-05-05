(defun my/latex-smart-dollar ()
  (interactive)
  (if (eq (char-before) ?$)
      (progn
        (backward-delete-char-untabify 1)
        (insert "\\\(\\\)")
        (backward-char 2))
    (insert "$")))

(defun my/latex-smart-displaymath ()
  (interactive)
  (if (eq (char-before) ?\\)
      (progn
        ;; (backward-delete-char-untabify 1)
        (insert "\[\\\]")
        (backward-char 2))
    (insert "\[")))


(defun my/latex-smart-displayset ()
  (interactive)
  (if (eq (char-before) ?\\)
      (progn
        ;; (backward-delete-char-untabify 1)
        (insert "\{\\\}")
        (backward-char 2))
    (insert "\{")))

(defun my/smart-paren ()
  (interactive)
  (if (eq  (char-before) ?\()
      (progn
        (insert ")")
        (backward-char))
    (insert ")")))


(defun my/smart-brace ()
  (interactive)
  (if (eq  (char-before) ?\{)
      (progn (insert "}") (backward-char))
    (insert "}")))

(defun my/smart-square-brace ()
  (interactive)
  (if (eq  (char-before) ?\[)
      (progn
        (insert "]")
        (backward-char))
    (insert "]")))


(defun my/smart-quote-double ()
  (interactive)
  (if (eq  (char-before) ?\")
      (progn
        (insert "\"")
        (backward-char))
    (insert "\"")))



(defun my/move-text-internal (arg)
   (cond
    ((and mark-active transient-mark-mode)
     (if (> (point) (mark))
            (exchange-point-and-mark))
     (let ((column (current-column))
              (text (delete-and-extract-region (point) (mark))))
       (forward-line arg)
       (move-to-column column t)
       (set-mark (point))
       (insert text)
       (exchange-point-and-mark)
       (setq deactivate-mark nil)))
    (t
     (beginning-of-line)
     (when (or (> arg 0) (not (bobp)))
       (forward-line)
       (when (or (< arg 0) (not (eobp)))
            (transpose-lines arg))
       (forward-line -1)))))

(defun my/move-text-down (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines down."
   (interactive "*p")
   (my/move-text-internal arg))

(defun my/move-text-up (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines up."
   (interactive "*p")
   (my/move-text-internal (- arg)))

(defun my/nuke-all-buffer ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))


