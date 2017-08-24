;;; package -- Summary
;;; Commentary:
;;;

;;; Code:
(eval-after-load 'forin-c-mode nil)
(after-load 'c-mode nil)

(defun run-c (BUFFER) "Run c bin in *run-c* BUFFER."
  (interactive
   (list "*run-c*")
   )
  (start-process-shell-command
   "run-c"
   BUFFER
   (concat "./"
           (file-name-base
            (buffer-name))))
  (switch-to-buffer-other-window BUFFER)
  (shell-mode)
  )

;;; (file-name-base (buffer-name)) => 应该使用一个局部变量来保存他
(defun compile-c () "Compile c source to same name file and run it."
  (interactive)
  (save-buffer)
  (compile
   (concat "gcc -g " (buffer-file-name) " -o "
           (file-name-base
            (buffer-name))
           "&& ./" (file-name-base (buffer-name))) t)
  (switch-to-buffer-other-window "*compilation*")
  )


;;; 两个线程会并行处理
;;; 方案一=> 重新拼接程序命令
;;; 方案二=> 使用python写编译、运行等脚本，然后使用emacs对其进行包装
(defun compile-and-run () "Compile c source and run it."
  (interactive)
  (progn
    (compile-c)
    (run-c "*run-c*"))
  )

(add-hook 'c-mode-hook
          (lambda ()
            (local-set-key (kbd "<f5>") 'compile-c
                           )))





(provide 'forin-c-mode)
;;; forin-c-mode ends here
