;;
;
;;(setq user-emacs-directory "~/..emacs.d")
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(add-to-list 'load-path "~/..emacs.d")

(require 'purcell-init)

(add-to-list 'load-path "~/Documents/KuaiPan/.emacs.d")

(require 'forin-init)


(provide 'init)
(put 'erase-buffer 'disabled nil)
