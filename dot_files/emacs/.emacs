(add-to-list 'load-path "~/.emacs.d/")

(add-to-list 'load-path "~/.emacs.d/mule-ucs/")
(require 'un-define) 
;; open
;;M-x universal-coding-system-argument
;; save
;;M-x set-buffer-file-coding-system
;; view
;;M-x describe-coding-system
;; (require 'un-define)
(set-language-environment "Japanese")
(setq default-buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(column-number-mode 1)
;; (set-clipboard-coding-system 'sjis-dos)

;; font testing ... ($ xlsfonts)
;; (set-default-font "VL Gothic")
;;(set-fontset-font (frame-parameter nil 'font)
;;  'japanese-jisx0208 '("VL Gothic" . "unicode-bmp")
;;  'japanese-jisx0201 '("VL Gothic" . "unicode-bmp"))
;; (create-fontset-from-fontset-spec
;; 	"-vlgothic-gothic-medium-r-normal--16-*-*-*-*-*-fontset-vlgothic16,
;; 	ascii:-vlgothic-gothic-medium-r-normal--16-*-*-*-*-*-fontset-vlgothic16,
;; 	japanese-jisx0208:-vlgothic-gothic-medium-r-normal--16-*-*-*-*-*-fontset-vlgothic16,
;; 	katakana-jisx0201:-vlgothic-gothic-medium-r-normal--16-*-*-*-*-*-fontset-vlgothic16")
;; 	japanese-jisx0208:-b&h-lucida-bold-r-normal-sans-14-140-75-75-p-92-iso8859-1,
;; 	katakana-jisx0201:-b&h-lucida-bold-r-normal-sans-14-140-75-75-p-92-iso8859-1")

(setq backup-by-copying t)
(defadvice make-backup-file-name
(around modify-file-name activate)
(let ((backup-dir "~/.emacs.b")) 
(setq backup-dir (expand-file-name backup-dir))
(unless (file-exists-p backup-dir)(make-directory-internal backup-dir))
(if (file-directory-p backup-dir)(let* ((file-path (expand-file-name file))
(chars-alist '((?/ . (?#))(?# . (?# ?#))(?: . (?\;))(?\; . (?\; ?\;))))
(mapchars(lambda (c) (or (cdr (assq c chars-alist)) (list c)))))
(setq ad-return-value(concat backup-dir "/"(mapconcat 'char-to-string
(apply 'append (mapcar mapchars file-path)) "")))) ad-do-it)))

(global-font-lock-mode t)
(font-lock-mode t)
;;(setq transient-mark-mode t)
(transient-mark-mode t)

(global-set-key "\C-cc" 'compile)
(global-set-key "\C-cg" 'grep)
(global-set-key "\C-cj" 'goto-line)
(global-set-key "\C-ch" 'query-replace)
;; (global-set-key "\C-c\C-v" 'cvs-update)
(global-set-key "\C-c\C-v" 'svn-status)
(global-set-key "\C-c\C-c" 'comment-region)
(global-set-key "\C-cm" 'man)
;; (global-set-key [\C-tab] 'dabbrev-expand)
;; (global-set-key [?\C-c\C-tab] 'align-entire)
(global-set-key (kbd "<backtab>") 'indent-region)

(global-set-key [\C-tab] 'indent-region)
(global-set-key (kbd "C-c TAB") 'align-entire)

(global-set-key [f12] 'next-error)
(global-set-key (kbd "ESC <f12>") 'previous-error)

(global-set-key [\C-f12] 'next-error)
(global-set-key [\M-f12] 'previous-error)

(global-set-key (kbd "C-c C-j") 'point-to-register)
;; C-x j ? jump to register
(global-set-key (kbd "C-x j") 'jump-to-register)

(global-set-key (kbd "C-c w") 'copy-to-register)
(global-set-key (kbd "C-c y") 'insert-register)

;; (load "escreen")
;; (escreen-install)

;; (global-set-key [\M-right] 'escreen-goto-next-screen)
;; (global-set-key [\M-left] 'escreen-goto-prev-screen)
;; (global-set-key [\M-up] 'escreen-create-screen)
;; (global-set-key [\M-down] 'escreen-goto-screen-0)

;; windows.el
;;   M-x win-resume-menu
;; windows.el
;;   M-x win-resume-menu
(require 'windows)
(win:startup-with-window)
(setq win:use-frame nil)
(define-key ctl-x-map "C" 'see-you-again)

;; revive.el
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe emacs" t)

(global-set-key (kbd "ESC <right>")  'win-next-window)
(global-set-key (kbd "ESC <left>") 'win-prev-window)
(global-set-key (kbd "ESC <up>") 'win-switch-menu)
(global-set-key (kbd "ESC <down>") 'win-toggle-window)

(global-set-key [\M-right] 'win-next-window)
(global-set-key [\M-left] 'win-prev-window)
(global-set-key [\M-up] 'win-switch-menu)
(global-set-key [\M-down] 'win-toggle-window)

(global-set-key [right] 'win-next-window)
(global-set-key [left] 'win-prev-window)
(global-set-key [up] 'win-switch-menu)
(global-set-key [down] 'win-toggle-window)

(require 'shell-command)
(shell-command-completion-mode)

(require 'session)
(add-hook 'after-init-hook 'session-initialize)

(require 'browse-kill-ring)
(setq kill-ring-max 500)
(global-set-key (kbd "C-c k") 'browse-kill-ring)

;; (defconst *dmacro-key* [?\M-o] "繰返し指定キー")
(defconst *dmacro-key* "\C-\\" "繰返し指定キー")
(global-set-key *dmacro-key* 'dmacro-exec)
(autoload 'dmacro-exec "dmacro" nil t)


(cond (
       (string-match "^23\." emacs-version)
       ;; nxml : need compile(elc)
       ;; (load "~/.emacs.d/nxml-mode-20041004/rng-auto.el")
       ;; (setq auto-mode-alist
       ;;       (cons '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode)
       ;; 	    auto-mode-alist))
       ;; (unify-8859-on-decoding-mode)
       ;; anything
       (require 'anything-config)
       (setq anything-sources (list anything-c-source-buffers
				    anything-c-source-bookmarks
				    anything-c-source-recentf
				    anything-c-source-file-name-history
				    anything-c-source-locate))
       (define-key anything-map (kbd "C-p") 'anything-previous-line)
       (define-key anything-map (kbd "C-n") 'anything-next-line)
       (define-key anything-map (kbd "C-v") 'anything-next-source)
       (define-key anything-map (kbd "M-v") 'anything-previous-source)
       (global-set-key (kbd "C-;") 'anything)
       )
)

;; tramp
(require 'tramp)
(add-to-list 'Info-default-directory-list " ~/sfw/share/info/")

;; C
(add-hook 'c-mode-common-hook
	  '(lambda ()
	     (progn
	       (c-toggle-hungry-state 1)
	       (c-set-style "k&r")
	       (setq c-basic-offset 2 indent-tabs-mode nil)	
	       ;(setq c-default-style "k&r")
	      ;(setq c-basic-offset 2 indent-tabs-mode t)
	       )
	     (require 'gtags)
	     )
	  )

;; C++
(add-hook 'c++-mode-common-hook
	  '(lambda ()
	     (progn
	       (c-toggle-hungry-state 1)
	       (c-set-style "k&r")
	       (setq c-basic-offset 2 indent-tabs-mode nil)	
	       (setq c-default-style "k&r")
	      ;(setq c-basic-offset 2 indent-tabs-mode t)
	       )
	     (require 'gtags)
	     )
	  )

(setq auto-mode-alist
      (append '(("\\.h$" . c++-mode))
              auto-mode-alist))

;; gtags
(add-hook 'gtags-mode-hook
	  '(lambda ()
	     (local-set-key [?\C-.] 'gtags-find-tag)
	     (local-set-key [?\C-,] 'gtags-find-rtag)
	     (local-set-key [?\C->] 'gtags-find-symbol)
	     (local-set-key [?\C-<] 'gtags-pop-stack)
	     )
	  )
(setq tab-width 2)

;; python
;; (add-hook 'python-mode-common-hook
;; 	  '(lambda ()
;; 	     (progn
;; 	       (local-set-key (kbd "C-c C-c") 'comment-region)
;; 	     ))
;; 	  )


;; ;; js
;; (add-to-list 'load-path "~/.emacs.d/js2")
;; (autoload 'js2-mode "js2" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; javascript.el
;; javascript-mode
(add-to-list 'auto-mode-alist (cons  "\\.\\(js\\|as\\|json\\|jsn\\)\\'" 'javascript-mode))
(autoload 'javascript-mode "javascript" nil t)
(setq js-indent-level 2)

;; paren match
(defun paren-match (arg)
  "Go to the matching parenthesis."
  (interactive "p")
  (cond ((looking-at "[[({]")
         (forward-sexp 1)
         (backward-char)
         )
        ((looking-at "[])}]")
         (forward-char)
         (backward-sexp 1)
         )
        (t (self-insert-command arg))
        ))
(global-set-key "\C-]" 'paren-match)
;; truncate line
(defun toggle-truncate-lines ()
  "toggle truncate lines"
  (interactive)
  (if truncate-lines
      (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))
(global-set-key "\C-cl" 'toggle-truncate-lines)
;; case-fold
(defun toggle-case-fold-search ()
  "toggle case-fold-search"
  (interactive)
  (if case-fold-search
      (setq case-fold-search nil)
    (setq case-fold-search t))
  (recenter))
(global-set-key "\C-cs" 'toggle-case-fold-search)

;; table ( use picture-mode for easy )
;;  defun : table-insert
(require 'table)
;; keisen
;; (if window-system
;;   (autoload 'keisen-mode "keisen-mouse" "MULE版罫線モード＋マウス" t)
;; 	(autoload 'keisen-mode "keisen-mule" "MULE版罫線モード" t))

;; cedet
;;(load-file "~/.emacs.d/cedet-1.0/common/cedet.el")
;; speedber
(global-set-key [f4] 'speedbar-get-focus)
;; ede
;;(require 'ede)
;;(global-ede-mode t)
;; svnx
(require 'psvn)
;; haskell
(add-to-list 'load-path "~/.emacs.d/haskell")
(setq auto-mode-alist
      (append auto-mode-alist
              '(("\\.[hg]s$"  . haskell-mode)
                ("\\.hi$"     . haskell-mode)
                ("\\.l[hg]s$" . literate-haskell-mode))))
(autoload 'haskell-mode "haskell-mode"
   "Major mode for editing Haskell scripts." t)
(autoload 'literate-haskell-mode "haskell-mode"
   "Major mode for editing literate Haskell scripts." t)
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-ghci)

(setq haskell-literate-default 'latex)
(setq haskell-doc-idle-delay 0)
(add-hook 'haskell-mode-hook
	  '(lambda ()
	     (local-set-key "\C-cq" 'haskell-hoogle)
     )
	  )

(autoload 'apache-mode "apache-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
(add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
(add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . apache-mode))

;; autoinsert
(setq user-fll-name "Hiroaki Kubota")
(setq user-mail-address "hiroaki.kubota@rakuten.co.jp")
(add-hook 'before-save-hook 'time-stamp)

(setq  auto-insert-directory "~/.emacs.d/ai-template/" )
(load "autoinsert" t)
(setq auto-insert-alist 
      (append '(("\\.sh"  . ["template.sh"   ai-replace])
                ("\\.xml" . ["template.xml"  ai-replace])
                ("\\.html". ["template.html" ai-replace])
		("\\.cgi" . ["template.cgi"  ai-replace])
                ("\\.pl"  . ["template.pl"   ai-replace])
                ("\\.py"  . ["template.py"   ai-replace])
                ("\\.rb"  . ["template.rb"   ai-replace])
                ("\\.hs"  . ["template.hs"   ai-replace])
                ("\\.h"   . ["template.h"    ai-replace])
                ("\\.cc"  . ["template.cc"   ai-replace])
                ("\\.cpp" . ["template.cc"   ai-replace])
                ("\\.c"   . ["template.c"    ai-replace])
                ("_controller\\.php" . ["cake_controller.php"   ai-replace])
                ("[Mm]akefile" . ["Makefile" ai-replace]))
	      auto-insert-alist ))
(add-hook 'find-file-hooks 'auto-insert)

(defvar ai-replace-alists
  '(("%file%" . (lambda()(file-name-nondirectory (buffer-file-name))))
    ("%def%" . (lambda()(upcase (replace-regexp-in-string "\\." "_" (file-name-nondirectory (buffer-file-name))))))
    ("%name%" . user-full-name)
    ("%mail%" . (lambda()(identity user-mail-address)))
    ("%cyear%" . (lambda()(substring (current-time-string) -4)))
    ("%cdate%" . (lambda()(format-time-string "%Y/%m/%d")))))

(defun ai-replace ()
  (time-stamp)
  (mapc #'(lambda(c)
	    (progn
	      (goto-char (point-min))
	      (replace-string (car c) (funcall (cdr c)) nil)))
	ai-replace-alists)
  (goto-char (point-max))
  (message "done."))


;; (setq load-path
;;       (append '("~/.emacs.d/howm") load-path))
;; (global-set-key "\C-ch" 'howm-menu)
;; (autoload 'howm-menu "howm-mode" "Hitori Otegaru Wiki Modoki" t)

;; (setq howm-menu-lang 'ja)
;; (setq howm-menu-lang 'ja
;;       howm-file-name-format "%Y/%m/%Y-%m-%d.howm"   ; ファイル名のフォーマットを指定(秒はつけない)
;;       howm-menu-top nil                             ; メニューのファイル名を指定
;;       howm-menu-file "~/howm/menu.howm" ; メニューファイル名を変更(0000-00-00-000000.howmはやだったので)
;;       howm-menu-footer "\n"             ; メニューのfooterを変更
;;       howm-keyword-file "~/howm/.keys"  ; キーワード(come-fromリンク)を保存するファイルを変更
;;       howm-template ""                  ; テンプレートを挿入しない
;;       )
;; ; iswitchbに無視させるバッファ名 (iswitchbを入れてない時はコメントにすること)
;; ;(add-to-list 'iswitchb-buffer-ignore "\\`[0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\}\\.howm\\'")
;; (add-to-list 'iswitchb-buffer-ignore "\\`\\.keys\\'")

;; ; `TAB'、<shift iso-lefttab> (シフトを押しながら `TAB') で前後のリンクに移動
;; (add-hook 'howm-mode-hook
;;           (lambda ()
;;             (define-key howm-mode-map [tab] 'action-lock-goto-next-link)
;;             (define-key howm-mode-map [(shift iso-lefttab)] 'action-lock-goto-previous-link)
;;             ))
;; ; メモファイルを作成した時(存在しないファイルに `C-c , ,' した時)に "= 予定" を挿入
;; (add-hook 'howm-create-file-hook
;;           (lambda ()
;;             (insert "= 予定")
;;             ))
;; ; auto-fill-modeを80文字でon
;; (add-hook 'howm-mode-hook
;;           (lambda ()
;;             (setq fill-column 80)
;;             (turn-on-auto-fill)
;;             ))
;; ; 予定表の表示範囲
;; (setq howm-menu-schedule-days-before 2)  ;; 2日前から
;; (setq howm-menu-schedule-days 14)  ;; 14日後まで

;; default to better frame titles
;; (setq frame-title-format
;;       (concat  "%b - emacs@" system-name))

;; Speed bar
;; (setq load-path
;;    (cons (expand-file-name "~/.eemacs.d/speedbar") load-path))
;; (autoload 'speedbar-frame-mode "speedbar" "Popup a speedbar frame" t)
;; (autoload 'speedbar-get-focus "speedbar" "Jump to speedbar frame" t)
;; (global-set-key [(f4)] 'speedbar-get-focus)



;; (setq auto-mode-alist
;;       (append (list
;;                '("\\.cpp$" . c++-mode)
;;                '("\\.cc$" . c++-mode)
;;                '("\\.c$" . c-mode)
;;                '("\\.h$" . c-mode)
;;                '("\\.hpp$" . c++-mode)
;;                '("\\.d$" . c++-mode)
;; 	       '("\\.java$" . java-mode)
;; 	       '("\\.pas$" . delphi-mode)
;;                '("\\.py$" . python-mode)
;;                auto-mode-alist)))

