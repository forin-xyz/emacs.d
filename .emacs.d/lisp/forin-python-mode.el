;;; package --- forin-python-mode
;;; Commentary:
;;; Code:
;;; Author: Cheng Rui


(require-package 'python-environment)
(require-package 'deferred)
(require-package 'jedi)

(autoload 'doctest-mode "doctest-mode" "Python doctest editing mode." t)

(defun run-ipython3 () "Call ipython3 interpreter."
  (interactive)
  (run-python "ipython3"))

(defun forin-python-shell-setup ()
  (setq
   python-shell-interpreter "ipython3"
   python-shell-interpreter-args ""
   python-shell-prompt-regexp "In \\[[0-9]+\\]: "
   python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
   python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
   python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
   python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"))

(defun forin-python-keymap () "Set python mode keymap."
  (local-set-key (kbd "C-c C-c") 'comment-region)
  (global-set-key (kbd "C-c C-n") 'indent-new-comment-line)
  (local-set-key (kbd "<f5>") 'compile-python)
  )

(defun compile-python () "Run python!"
  (interactive)
  (save-buffer)
  (compile
   (concat "python3 " (buffer-file-name)) t)
  (switch-to-buffer-other-window "*compilation*")
  )

(defvar jedi-mode-hook
  nil)

(add-hook 'jedi-mode-hook
          (lambda ()
            (local-set-key (kbd "C-<tab>") 'jedi:complete)))


(add-hook 'python-mode-hook
          'forin-python-shell-setup
          t)

(add-hook 'python-mode-hook
          'forin-python-keymap
          t)

(add-hook 'python-mode-hook '(lambda () (run-hooks 'jedi-mode-hook))
          )

(add-hook 'python-mode-hook 'jedi:setup)

(provide 'forin-python-mode)
;;; forin-python-mode.el ends here
