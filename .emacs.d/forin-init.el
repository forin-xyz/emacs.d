;;; package --- init file of forin.xyz
;;; Commentary:
;;; You can load this emacs.d file through append follow code:
;;; (add-to-list 'load-path "/path/to/this/.emacs.d")
;;; (require 'forin-init)
;;; in your own .emacs file, "/path/to/this/.emacs,d"
;;; replaced by this .emacs.d directory path.

;;; Code:

(defvar forin-directory nil "Directory of forin-xyz's emacs.d.")

(setq forin-directory (if load-file-name
                          (file-name-directory load-file-name)
                        default-directory))

(add-to-list 'load-path
             (expand-file-name "lisp"
                               forin-directory))

(add-to-list 'load-path
             (expand-file-name "site-lisp"
                               (if load-file-name
                                   (file-name-directory load-file-name)
                                 default-directory)))

(require 'forin-shell)
(require 'forin-ydfy)
(require 'forin-no-gui)    ;;  隐藏菜单栏以及滚动条
(require 'forin-c-mode)
(require 'forin-cc-mode)
(require 'forin-python-mode)
(require 'forin-global-key)


(provide 'forin-init)
;;; forin-init.el ends here
