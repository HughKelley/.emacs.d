
;; to diff between os's
;;(load-file (expand-file-name
  ;;          (cond ((eq system-type 'windows-nt) "windows.el")
    ;;              ((eq system-type 'gnu/linux) "linux.el")
      ;;            (t "default-system.el"))
        ;;    user-emacs-directory))

;; helpful examples

;; https://github.com/gjstein/emacs.d/blob/master/init.el

;; can use M-x eval-buffer to reload this file after changes. 
;; use C-H v user-init-file RET to check location of init file

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


(package-initialize)

;; my changes
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; paste
(global-set-key (kbd "C-f") 'isearch-forward-regexp)
;; copy

;; copy paste mode when text is highlighted
;(cua-mode t)
;(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
;(transient-mark-mode 1) ;; No region when it is not highlighted
;(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

;; cut

;; test change on asus branch

;; the startup screen also sets the home directory to emacs/bin
(setq inhibit-startup-screen t)
(setq default-directory "C:/Users/hkelley/")

;;(princ (format "Hello, %s!\n" "World"))

(transient-mark-mode 1)

;; show line numbers on all files
(require 'linum)

(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))
(when (version< emacs-version "26.0.50")
  (global-linum-mode 1))
;;
;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

(require 'use-package)

(require 'elpy)
(use-package elpy
  :ensure t
  :init
  (elpy-enable))

(require 'org-install)
(require 'org)
(require 'org-habit)
(add-to-list 'org-modules "org-habit")

(setq org-modules '(org-bbdb
                    org-gnus
                    org-info
                    org-habit
                    org-irc
                    toc-org))

(eval-after-load 'org
  '(org-load-modules-maybe t))

;(if (require 'toc-org nil t)
 ;   (add-hook 'org-mode-hook 'toc-org-mode)
;
    ;; enable in markdown, too
 ;   (add-hook 'markdown-mode-hook 'toc-org-mode)
  ;  (define-key markdown-mode-map (kbd "\C-c\C-o") 'toc-org-markdown-follow-thing-at-point)
;  (warn "toc-org not found"))

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
;; (setq org-agenda-archives-mode t)

(setq org-agenda-span 10)
(setq org-agenda-tags-column -100) ; take advantage of the screen width
(setq org-agenda-sticky nil)
(setq org-agenda-inhibit-startup t)
(setq org-agenda-use-tag-inheritance t)
(setq org-agenda-show-log t)
(setq org-agenda-show-future-repeats nil)
(setq org-agenda-skip-deadline-prewarning-if-scheduled 'pre-scheduled)
(setq org-log-done 'note)
(setq org-hide-leading-stars t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-if-done t)
(setq-default tab-width 4)
(setq org-habit-graph-column 80)
(setq org-agenda-start-day "-5d")
(setq org-startup-folded t)
(define-key org-agenda-mode-map "y" 'org-agenda-todo-previousset)


;(setq org-todo-keywords '((sequence "TODO" "IN-PROGRESS" "WAITING" "CANCELLED" "DONE")))
(setq org-todo-keywords '("TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELLED"))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; bind C-x g to magit-status
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch)
;(debug-on-variable-change 'org-agenda-files)

; for asusk
;(setq org-agenda-files (list "C:/Users/Hugh/Documents/CS/Org"))

;(setq org-agenda-files '("C:/Users/hkelley/Documents/org"))

;(setq org-agenda-files (list "C:/Users/hkelley/Documents/org/gtd.org"))

(setq org-agenda-files (list "C:/Users/hkelley/code/org/TDG_Work.org" "C:/Users/hkelley/code/org/habits.org" "C:/Users/hkelley/code/org/gtd.org"))

(global-set-key (kbd "C-c u") 'sqlup-capitalize-keywords-in-region)

(add-hook 'sql-mode-hook 'sqlup-mode)
(add-hook 'sql-interactive-mode-hook 'sqlup-mode)
(add-hook 'redis-mode-hook 'sqlup-mode)
(setq sqlup-blacklist (list "generated"))
;; (sql-set-product 'postgres)
; for tpad
;(setq org-agenda-files (list "~/code/org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (misterioso)))
 '(org-agenda-files
   (quote
	("C:/Users/hkelley/code/org/TDG_Work.org" "C:/Users/hkelley/code/org/habits.org" "C:/Users/hkelley/code/org/gtd.org")))
 '(org-modules
   (quote
	(org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))
 '(org-tags-column -90)
 '(package-selected-packages
   (quote
	(sqlup-mode auto-complete ess toc-org web-mode use-package elpy magit pdf-tools org-pomodoro better-defaults pomidor))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;;(add-to-list 'load-path "C:/Users/Hugh/Documents/CS/Org/better-defaults")
;; (require 'better-defaults)

;; pomidor
(setq pomidor-seconds (* 25 60)) ; 25 minutes for the work period
(setq pomidor-break-seconds (* 5 60)) ; 5 minutes break time

(setq pomidor-sound-tick nil
      pomidor-sound-tack nil)

(use-package org-pomodoro
  :ensure t
  :commands (org-pomodoro)
  :config
    (setq alert-user-configuration (quote ((((:category . "org-pomodoro")) libnotify nil)))))


(global-visual-line-mode t)

(defalias 'list-buffers 'ibuffer) ; make ibuffer default
