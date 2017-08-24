;;; package --- youdao translate
;;; Commentary:
;;; Code:

;;; you can set your own translate command
;;; (setq ydfy-path "path/to/ydfy" )
;;; or
;;; (setq ydfy-path "transalte")

(defvar ydfy-path
  nil "Youdao translate path, /path/to/ydfy.")

(setq ydfy-path
      (expand-file-name "ydfy/ydfy.py"
                        (expand-file-name "site-lisp" forin-directory)))

(defun ydfy (buffer) "Youdao translate in BUFFER."
  (interactive
   (list
    (read-string "Buffer:" "*有道翻译*" t)
    ))
  ;;; ydfypath = /path/to/.emacs.d/site-lisp/ydfy/ydfy.py

  (progn
    (start-process-shell-command "ydfy-1" buffer (concat "python3 " ydfy-path))
    (switch-to-buffer buffer)
    (shell-mode)
    (auto-complete-mode)
    )
  )

(provide 'forin-ydfy)
;;; forin-ydfy.el ends here
