;; ---------------------
;; -- Global Settings --
;; ---------------------
(setq user-full-name "Mike Foreman")
(setq user-mail-address "mforeman15@gmail.com")
(add-to-list 'load-path "~/.emacs.d/elpa)")
(setq frame-title-format '("Emacs @ " system-name ": %b %+%+ %f")) ;set window title to full file name


;;=elpa+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(require 'package)

(add-to-list 'package-archives
             '( "original" . "http://tromey.com/elpa/" ))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))

(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(setq package-archive-enable-alist '(("melpa" deft magit)))	     
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(
                          clojure-mode
                          deft
;;                          feature-mode
                          find-file-in-project
;;                          flycheck
                          gist
                          htmlize
                          idle-highlight-mode
                          js2-mode
                          magit
                          marmalade
                          nodejs-repl
;;                          cider
                          org
                          paredit
                          redo+
                          restclient
                          sass-mode
                          scala-mode
                          smex
                          solarized-theme
                          web-mode
                          writegood-mode
 ;;                         wrap-region
                          yasnippet
			  ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;;;; turn off splash screen, start in org mode
;;(setq inhibit-splash-screen t
;;      initial-scratch-message nil
;;      initial-major-mode 'org-mode)
 
;;Org Mode setting
;;Enable logging when tasks are complete. This puts a time-stamp on the completed task.
;;Since I usually am doing quite a few things at once, I added the INPROGRESS keyword and
;;made the color blue. Finally, enable flyspell-mode and writegood-mode
;;when org-mode is active.

(add-hook 'org-mode-hook
          (lambda ()
            (writegood-mode)))

;; Ido is a nice way to navigae the filesystem
(ido-mode t)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)

;;Power lisp mode
(setq lisp-modes '(lisp-mode
                   emacs-lisp-mode
                   common-lisp-mode
                   clojure-mode))

;;(require 'cl)

(require 'ido)
;;(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
(require 'linum)
;;(require 'smooth-scrolling)
;;(require 'whitespace)
(require 'deft)
(require 'dired-x)
;;(require 'compile)
(ido-mode t)

;;------------------------------------------------
;; == INIT & CONFIG
;;------------------------------------------------

;;=speedbar
(setq speedbar-use-images nil)

;;=deft
(setq deft-extension "txt")
;; (setq deft-extension "org")
;; (setq deft-text-mode 'org-mode)
(setq deft-use-filename-as-title t)
(global-set-key [f8] 'deft)


;; smart indenting and pairing for all
;;(electric-layout-mode 1)
(electric-pair-mode 1)
;;(electric-indent-mode  1)



(normal-erase-is-backspace-mode 1)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq column-number-mode t)
(setq inhibit-startup-message t)
(setq save-abbrevs nil)
(setq show-trailing-whitespace t)
(setq suggest-key-bindings t)
(setq vc-follow-symlinks t)

;;=autocomplete
;; Start auto-completion after 2 characters of a word
(setq ac-auto-start 2)
;; case sensitivity is important when finding matches
(setq ac-ignore-case nil)

(setq bookmark-default-file "~/.emacs.d/emacs.bmk")


;;JS2-mode
;;(add-hook 'js-mode-hook 'js2-minor-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq js2-highlight-level 3)

;;;;(require 'flycheck)
;;(add-hook 'js-mode-hook
;;          (lambda () (flycheck-mode t)))

;;Display
;; Use a vertical bar as cursor
(blink-cursor-mode 1)
(show-paren-mode 1)
(setq-default indicate-empty-lines t)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(global-font-lock-mode 1) ; Enable syntax highlighting when editing code.

(setq transient-mark-mode t) ; Highlight selected regions

;;Themes
(require 'darcula-theme)
(set-frame-font "Calibri-12.0" )

;;(if window-system
;;    ;;    (load-theme 'solarized-dark t)
;;        (load-theme 'darcula t)
;;  (load-theme 'wombat t))

;; Toolbars
(tool-bar-mode -1)
(menu-bar-mode 1)



