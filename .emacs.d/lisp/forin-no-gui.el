;;

(defun no-gui (ENABLE)
  "When ENABLE is t, emacs removes the GUI, otherwise GUI is visiable.
    Return nil if t otherwise t."
  (interactive
   (list (y-or-n-p "Enable no GUI:")))

  (if ENABLE
      (progn
        (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
        (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
        (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
        )
    (progn
      (if (fboundp 'scroll-bar-mode) (scroll-bar-mode 1))
      (if (fboundp 'tool-bar-mode) (tool-bar-mode 1))
      (if (fboundp 'menu-bar-mode) (menu-bar-mode 1))
      )))

(no-gui t)

(provide 'forin-no-gui)
;;;for-no-gui.el ends here
