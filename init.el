(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize) ;; You might already have this lineq
;;(package-refresh-contents)

(setq custom-safe-themes t)
(custom-set-variables
 '(custom-enabled-themes '(monokai))
 '(package-selected-packages '(markdown-mode))
 ;; 显示行号
 '(global-display-line-numbers-mode t)
 ;;高亮当前行，当文本内容很多时可以很容易找到光标的位置。 
 '(global-hl-line-mode t)
 ;; 关闭启动帮助画面
 '(inhibit-splash-screen t)
 ;;自动打开最后一次浏览的文件
 '(desktop-save-mode t)

 )

(custom-set-faces
 '(default ((t (:family "Sarasa Mono SC" :foundry "outline" :slant normal :weight regular :height 141 :width normal)))))


(setq url-gateway-method 'socks)
(setq socks-server '("Default server" "127.0.0.1" 2080 5))

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)


;; lsp-bridge
(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
         ("C-c C-e" . markdown-do)))

(add-to-list 'load-path "~/.emacs.d/ext/posframe")
(require 'posframe)
 
(add-to-list 'load-path "~/.emacs.d/ext/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

(add-to-list 'load-path "~/.emacs.d/ext/lsp-bridge")
(require 'lsp-bridge)
(global-lsp-bridge-mode)

;; Python
(setq lsp-bridge-python-lsp-server 'pyright)
(setq lsp-bridge-python-multi-lsp-server 'pyright_ruff)

;;我们可以用下面代码将 Emacs 设置为开启默认全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 把所有备份文件存放在 ~/.emacs.d/.backups
(setq
    backup-by-copying t
    backup-directory-alist (quote (("." . "~/.emacs.d/.backups/")))
    delete-old-versions t
    kept-new-versions 6
    kept-old-versions 2
    version-control t)

;; 绑定 F2 快捷键打开配置文件
(defun open-init-file()
    (interactive)
    (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-init-file)
