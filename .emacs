;--------------------------------------------------------------------
; plugin management like pathogen
;--------------------------------------------------------------------
(let ((default-directory "~/.emacs.d/bundle"))
  (setq load-path (cons default-directory load-path))
  (normal-top-level-add-subdirs-to-load-path))

;管理系
;--------------------------------------------------------------------
; BUNDLE: git://gitorious.org/vimpulse/vimpulse.git
; BUNDLE: http://github.com/tarao/vimpulse-plugins/raw/master/vimpulse-cjk.el

;表示系
;--------------------------------------------------------------------

;編集系
;--------------------------------------------------------------------
; BUNDLE: git://github.com/crazycode/yasnippet.git

;検索系
;--------------------------------------------------------------------
; BUNDLE: git://github.com/tsgates/pylookup
; BUNDLE: https://bitbucket.org/jonwaltman/pydoc-info

;ファイル系
;--------------------------------------------------------------------

;開発系
;--------------------------------------------------------------------
; BUNDLE: git://github.com/offbyone/Pymacs.git
; BUNDLE: http://bitbucket.org/agr/ropemacs
; BUNDLE: pip install rope ropemode Pymacs
; BUNDLE: http://mercurial.intuxication.org/hg/anythingipython
; BUNDLE: http://ipython.scipy.org/dist/ipython.el

;--------------------------------------------------------------------
;Settings
;--------------------------------------------------------------------
;Erlang Settings
;--------------------------------------------------------------------
(setq erlang_home (getenv "ERLANG_HOME"))
(if (null erlang_home)
    (setenv "ERLANG_HOME" "/usr/lib64/erlang"))
(setq load-path
      (cons (let ((erllib (concat (getenv "ERLANG_HOME") "/lib/")))
              (concat erllib (file-name-completion "tools-" erllib) "emacs"))
            load-path))
(setq erlang-root-dir (getenv "ERLANG_HOME"))
(setq exec-path (cons (concat (getenv "ERLANG_HOME") "/bin") exec-path))
(require 'erlang-start)

;Basic Settings
;--------------------------------------------------------------------
;; tool bar を表示させない
(tool-bar-mode 0)
;; menu bar を表示させない
(menu-bar-mode -1)
;; スプラッシュを非表示にする
(setq inhibit-startup-message t)

;; 行番号・桁番号を modeline に表示する
(line-number-mode t)   ; 行番号
(column-number-mode t) ; 桁番号

;;; スクロールバーを右側に表示する
(set-scroll-bar-mode 'right)

;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;;; モードラインに時間を表示する
(display-time)

;;; 現在の関数名をモードラインに表示
(which-function-mode 1)

;;; タイトルバーにファイル名を表示する
(setq frame-title-format (format "emacs@%s : %%f" (system-name)))

;;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;;; emacsclient サーバを起動
(server-start)

;--------------------------------------------------------------------
;Keybinds
;--------------------------------------------------------------------

;--------------------------------------------------------------------
;Functions
;--------------------------------------------------------------------

;--------------------------------------------------------------------
;Default Plugins
;--------------------------------------------------------------------
;flymake
;--------------------------------------------------------------------
(require 'flymake)
(when (load "flymake" t) 
  ;Erlang
  ;Require: erlan-start
  (require 'erlang-flymake)

  ;Python
  ;Require: pip install pyflakes
  ;(defun flymake-pyflakes-init () 
  ;  ; Make sure it's not a remote buffer or flymake would not work
  ;  (when (not (subsetp (list (current-buffer)) (tramp-list-remote-buffers)))
  ;    (let* ((temp-file (flymake-init-create-temp-buffer-copy 
  ;                        'flymake-create-temp-inplace)) 
  ;           (local-file (file-relative-name 
  ;                         temp-file 
  ;                         (file-name-directory buffer-file-name)))) 
  ;      (list "pyflakes" (list local-file)))))
  ;(add-to-list 'flymake-allowed-file-name-masks 
  ;             '("\\.py\\'" flymake-pyflakes-init))
  ;(add-hook 'python-mode-hook '(lambda () (flymake-mode t)))

  ;C++
  ;(defun flymake-cc-init ()
  ;  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
  ;                        'flymake-create-temp-inplace))
  ;         (local-file  (file-relative-name
  ;                        temp-file
  ;                        (file-name-directory buffer-file-name))))
  ;    (list "g++" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))
  ;
  ;(push '("\\.cc$" flymake-cc-init) flymake-allowed-file-name-masks)
  ;(add-hook 'c++-mode-hook '(lambda () (flymake-mode t)))

  ;Bash
  ;(require 'flymake-shell)
  ;(when (load "flymake-shell" t) 
  ;  (add-hook 'sh-mode-hook 'flymake-shell-load)
  ;  ) 
) 

;--------------------------------------------------------------------
;Plugins
;--------------------------------------------------------------------
;vimpluse
;--------------------------------------------------------------------
(require 'vimpulse)
;; 検索の際に大文字小文字を区別しない(smartcase)
(setq viper-case-fold-search t)
;; 検索はループする
(setq viper-search-wrap-around t)
;; オートインデントをデフォルトで有効
(setq-default viper-auto-indent t)
;; インデント幅
(setq viper-shift-width tab-width)

;; 物理行移動を基本にする
(vimpulse-map "j" 'next-line)
(vimpulse-map "k" 'previous-line)
(vimpulse-map [?\C-n] 'viper-next-line)
(vimpulse-map [?\C-p] 'viper-previous-line)

;; deleteと backspaceキーは文字削除
(vimpulse-map [delete] 'vimpulse-delete)
(vimpulse-map [backspace] 'backward-delete-char-untabify)

;; ビジュアルモードの backspaceキーは選択文字列削除
(vimpulse-vmap [backspace] 'vimpulse-delete)

;; settings for auto-complete.el
;(setq ac-use-quick-help nil)
;(setq ac-use-menu-map t)
;(define-key ac-completing-map "\C-[" 'viper-exit-insert-state)

;; モードラインの色設定 保存/復元
(setq my-viper-default-face-background (face-background 'mode-line))
(defadvice viper-go-away (after my-viper-go-away-restore activate)
  (set-face-background 'mode-line my-viper-default-face-background))

;; モードラインの色変更
(defun my-viper-set-mode-line-face ()
  (unless (minibufferp (current-buffer))
    (set-face-background 'mode-line (cdr (assq viper-current-state
        '((vi-state     . "DimGrey")
          (insert-state . "Yellow3")))))))
(dolist (hook (list
  'viper-vi-state-hook
  'viper-insert-state-hook
  ))(add-hook hook 'my-viper-set-mode-line-face))

;vimpluse-cjk
;--------------------------------------------------------------------
(setq vimpulse-cjk-want-japanese-phrase-as-word t)
(require 'vimpulse-cjk)

;yasnipet
;--------------------------------------------------------------------
(require 'yasnippet)
(when (load "yasnippet" t) 
  (yas/initialize)
  (yas/load-directory "~/.emacs.d/bundle/yasnippet/snippets")
  )

;Distel
;--------------------------------------------------------------------
  (require 'distel)                                                                                  
  (distel-setup)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
