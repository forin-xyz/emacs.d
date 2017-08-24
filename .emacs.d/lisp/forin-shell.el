;;; package --- shell
;;; Commentary:
;;; Code:

(defun shell-buffer (buffer) "Open a terminal in BUFFER."
  (interactive 
   (list
    (read-string "sBuffer:" "*shell*" t)
    ))
  (progn
    (shell buffer)
    (auto-complete-mode t)
    )
  )

(provide 'forin-shell)
;;; forin-shell.el ends here
