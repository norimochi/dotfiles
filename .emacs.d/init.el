;;
;; パッケージ読み込み
;;
 
(require 'package)
 
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/") t)
 
(package-initialize)

;;; P61 Elisp配置用のディレクトリを作成
;; load-pathを追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; 引数のディレクトリとそのサブディレクトリをload-pathに追加
;; (add-to-load-path "elisp" "conf" "public_repos")




(global-set-key (kbd "C-c t") 'toggle-truncate-lines)

(setq exec-path (cons "/usr/local/bin" exec-path))

;; フォントを Ricty Diminished (変更したい場合)
(add-to-list 'default-frame-alist '(font . "Ricty-18"))


;; 時間も表示
(display-time)

;; メニューバーを非表示
(menu-bar-mode 0)
;; 現在ポイントがある関数名をモードラインに表示
(which-function-mode 1)
;; 対応する括弧をハイライト
(show-paren-mode 1)
;; リージョンのハイライト
(transient-mark-mode 1)
;; current directory 表示
(let ((ls (member 'mode-line-buffer-identification
                  mode-line-format)))
  (setcdr ls
    (cons '(:eval (concat " ("
            (abbreviate-file-name default-directory)
            ")"))
          (cdr ls))))

;; (require 'skk-autoloads)                                                                                                                                                                        
(global-set-key "\C-x\C-j" 'skk-mode)

;; stickyの設定                                                                                                                                                                                           
(setq skk-sticky-key ";")

;; AZIK                                                                                                                                                                                           
(setq skk-use-azik t)

(require 'migemo)
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))

;; 辞書ファイルを環境に合わせて設定してください！
(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")

(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(load-library "migemo")
(migemo-init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(helm-migemo init-open-recentf recentf-ext helm migemo ddskk)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(recentf-mode 1)
;; ido/anything/helmのうちどれかを指定する
(setq init-open-recentf-interface 'helm)
(init-open-recentf)
