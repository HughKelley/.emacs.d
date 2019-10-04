
;; can use M-x eval-buffer to reload this file after changes. 
;; use C-H v user-init-file RET to check location of init file

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; the startup screen also sets the home directory to emacs/bin
(setq inhibit-startup-screen t) 

;;(princ (format "Hello, %s!\n" "World"))

(transient-mark-mode 1)

;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

(require 'use-package)

(use-package elpy
  :ensure t
  :init
  (elpy-enable))

(require 'org-install)
(require 'org)						       	;org mode
(setq org-log-done 'note)
              ; start up screen
(setq-default tab-width 4)

(setq default-directory "C:/Users/Hugh/Documents/CS/")

(setq org-todo-keywords '((sequence "TODO" "IN-PROGRESS" "WAITING" "CANCELLED" "DONE")))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

;;(debug-on-variable-change 'org-agenda-files)
(setq org-agenda-files (list "C:/Users/Hugh/Documents/CS/Org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (misterioso)))
 '(org-tags-column -90)
 '(package-selected-packages
   (quote
	(use-package elpy magit pdf-tools org-pomodoro better-defaults pomidor))))
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

(global-visual-line-mode t)

(defalias 'list-buffers 'ibuffer) ; make ibuffer default
