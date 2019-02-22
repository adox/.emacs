(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(defalias 'yes-or-no-p 'y-or-n-p)

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package evil
  :ensure t
  :config
  (evil-mode t))

;; (use-package flycheck
;;   :ensure t
;;   :init (global-flycheck-mode))

(use-package itail
  :ensure t)

(use-package phpcbf
  :ensure t
  :config
  (setq phpcbf-standard "PSR2"))

(use-package dumb-jump
  :ensure t)

(use-package markdown-mode
  :ensure t)

(use-package magit
  :ensure t)

(use-package magit-svn
  :ensure t)

(use-package evil-magit
  :ensure t)

(use-package ivy
  :ensure t
  :config
  (ivy-mode))

(use-package swiper
  :ensure t)

(use-package projectile
  :ensure t
  :defer t
  :config
  (projectile-global-mode))

(use-package ag
  :ensure t)

(use-package counsel
  :ensure t
  :config
  (counsel-projectile-mode))

; company mode
(use-package company
  :ensure t)

(add-hook 'after-init-hook 'global-company-mode)
(setq company-dabbrev-downcase 0)
(setq company-idle-delay 0)

(add-hook 'php-mode-hook
          '(lambda ()
             (require 'company-php)
             (company-mode t)
             (ac-php-core-eldoc-setup) ;; enable eldoc
             (make-local-variable 'company-backends)
             (add-to-list 'company-backends 'company-ac-php-backend)))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package evil-escape
  :ensure t
  :config
  (evil-escape-mode t)
  (setq-default evil-escape-key-sequence "kj")
  (setq-default evil-escape-delay 0.2))

(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "a" 'projectile-ag
    "g" 'counsel-ag
    "b" 'eval-buffer
    "e" 'find-file
    "f" 'counsel-projectile
    "k" 'kill-buffer
    "m" 'er-switch-to-previous-buffer
    "o" 'ivy-switch-buffer
    "r" 'counsel-recentf
    "s" 'swiper
    "v" 'magit))

;; global keys defines
(define-key global-map "\M-m" 'er-switch-to-previous-buffer)
(define-key global-map "\M-o" 'ivy-switch-buffer)
(define-key global-map "\M-k" 'kill-this-buffer)
(define-key global-map "\M-f" 'counsel-projectile)
(define-key global-map "\M-r" 'counsel-recentf)
(define-key global-map "\M-[" 'other-window)
(define-key global-map "\M-]" 'prev-window)
(define-key global-map "\M-s" 'save-buffer)
(define-key global-map "\M-g" 'projectile-ag)
(define-key global-map "\M-b" 'bury-buffer)
(define-key projectile-mode-map [?\M-g] 'projectile-ag)

;; unset C- and M- digit keys
(dotimes (n 10)
  (global-unset-key (kbd (format "C-%d" n)))
  (global-unset-key (kbd (format "M-%d" n)))
  )

(use-package eyebrowse
  :diminish eyebrowse-mode
  :config (progn
            (define-key eyebrowse-mode-map (kbd "M-1") 'eyebrowse-switch-to-window-config-1)
            (define-key eyebrowse-mode-map (kbd "M-2") 'eyebrowse-switch-to-window-config-2)
            (define-key eyebrowse-mode-map (kbd "M-3") 'eyebrowse-switch-to-window-config-3)
            (define-key eyebrowse-mode-map (kbd "M-4") 'eyebrowse-switch-to-window-config-4)
            (eyebrowse-mode t)
            (setq eyebrowse-new-workspace t)))

(setq make-backup-files nil)

(defun prev-window ()
  (interactive)
  (other-window -1))

(use-package php-mode
  :ensure t)

(use-package evil-commentary
  :ensure t
  :config
  (evil-commentary-mode))

; telephone-line
(use-package telephone-line
  :ensure t)

(setq telephone-line-primary-left-separator 'telephone-line-flat
      telephone-line-secondary-left-separator 'telephone-line-flat
      telephone-line-primary-right-separator 'telephone-line-flat
      telephone-line-secondary-right-separator 'telephone-line-flat)
(setq telephone-line-height 16
      telephone-line-evil-use-short-tag t)
(telephone-line-mode 1)

; org
(use-package org
  :ensure t)

(use-package ox-twbs
  :ensure t)

(use-package ox-reveal
  :ensure t)

(global-set-key (kbd "C-c c") 'org-capture)

;; set nice template for org mode code review
(setq org-default-notes-file "~/review.org")
(setq org-capture-templates
      '(("t" "Todo" entry (file "~/Refile.org")
	 "* TODO %?\n%U" :empty-lines 1)
	("r" "Review" entry (file "~/review.org")
	 "* %f::%(with-current-buffer (org-capture-get :original-buffer) (number-to-string (line-number-at-pos (region-beginning))))\n\n %?\n\n #+BEGIN_SRC php\n %i \n #+END_SRC " :empty-lines 1))
      )

;; for ob-http
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
    (emacs-lisp . t)
    (http . t)
    (shell . t)
   )
 )

(use-package org-bullets
  :ensure t)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "M-p") 'ace-window))

;; (use-package auto-dim-other-buffers
;;   :ensure t
;;   :config
;;   (auto-dim-other-buffers-mode))

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))
    

(use-package better-shell
    :ensure t
    :bind (("C-'" . better-shell-shell)
	   ("C-," . better-shell-for-projectile-root)
           ("C-;" . better-shell-remote-open)))

(use-package evil-lion
  :ensure t
  :bind (:map evil-normal-state-map
         ("g a " . evil-lion-left)
         ("g A " . evil-lion-right)
         :map evil-visual-state-map
         ("g a " . evil-lion-left)
         ("g A " . evil-lion-right)))

;; (require 'org)
;; (define-key global-map "\C-cl" 'org-store-link)
;; (define-key global-map "\C-ca" 'org-agenda)
;; (setq org-log-done t)

(setq inhibit-startup-message t)
(setq-default truncate-lines t)
(set-face-attribute 'default nil :font "Monaco-9")
(load-theme 'base16-eighties t)

;; disable bold font face
;; bold makes me angry
 (mapc
  (lambda (face)
    (set-face-attribute face nil :weight 'normal :underline nil))
  (face-list))

;; auto php mode on inc files (moma yeah)
(add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))

;; auto tail mode on logs
(add-to-list 'auto-mode-alist '("\\.log\\'" . itail-mode))

(defun er-switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))



(require 'php-doc)
(require 'magit-gerrit)

(add-hook 'php-mode-hook
          (lambda ()
            (local-set-key (kbd "M-P") 'php-insert-doc-block)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "11e57648ab04915568e558b77541d0e94e69d09c9c54c06075938b6abc0189d8" "8885761700542f5d0ea63436874bf3f9e279211707d4b1ca9ed6f53522f21934" "7559ac0083d1f08a46f65920303f970898a3d80f05905d01e81d49bb4c7f9e39" "e7b49145d311e86da34a32a7e1f73497fa365110a813d2ecd8105eaa551969da" "fede08d0f23fc0612a8354e0cf800c9ecae47ec8f32c5f29da841fe090dfc450" "50d07ab55e2b5322b2a8b13bc15ddf76d7f5985268833762c500a90e2a09e7aa" "dd4628d6c2d1f84ad7908c859797b24cc6239dfe7d71b3363ccdd2b88963f336" "16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" "b563a87aa29096e0b2e38889f7a5e3babde9982262181b65de9ce8b78e9324d5" "003a9aa9e4acb50001a006cfde61a6c3012d373c4763b48ceb9d523ceba66829" "d61f6c49e5db58533d4543e33203fd1c41a316eddb0b18a44e0ce428da86ef98" "840db7f67ce92c39deb38f38fbc5a990b8f89b0f47b77b96d98e4bf400ee590a" "1b27e3b3fce73b72725f3f7f040fd03081b576b1ce8bbdfcb0212920aec190ad" "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" "3eb93cd9a0da0f3e86b5d932ac0e3b5f0f50de7a0b805d4eb1f67782e9eb67a4" "721bb3cb432bb6be7c58be27d583814e9c56806c06b4077797074b009f322509" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" "eae831de756bb480240479794e85f1da0789c6f2f7746e5cc999370bbc8d9c8a" "85e6bb2425cbfeed2f2b367246ad11a62fb0f6d525c157038a0d0eaaabc1bfee" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "e1498b2416922aa561076edc5c9b0ad7b34d8ff849f335c13364c8f4276904f0" "4138944fbed88c047c9973f68908b36b4153646a045648a22083bd622d1e636d" "8d805143f2c71cfad5207155234089729bb742a1cb67b7f60357fdd952044315" "13131de3a7fdb8f2ff490f2ec708aeafeb8929237bdafef729056b4380311c32" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default)))
 '(dumb-jump-mode t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(itail-highlight-list
   (quote
    (("Error" . hi-red)
     ("fatal" . hi-red)
     ("[0-9]\\{1,3\\}\\.[0-9]\\{1,3\\}\\.[0-9]\\{1,3\\}\\.[0-9]\\{1,3\\}" . font-lock-string-face))))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (itail expand-region eyebrowse company-php org-bullets json-mode ob-http try web-mode orgtbl-show-header magit-gerrit ox-reveal htmlize company auto-dim-other-buffers wgrep-ag wgrep ag molokai-theme noctilux-theme zerodark-theme counsel-tramp tramp-term phpunit phpcbf dumb-jump magit-svn evil-magit moe-theme airline-themes powerline ace-window ujelly-theme spacegray-theme use-package telephone-line smyx-theme powerline-evil php-mode paganini-theme ox-twbs monokai-theme markdown-mode helm-projectile helm-ag hc-zenburn-theme evil-visual-mark-mode evil-surround evil-leader evil-escape evil-commentary darktooth-theme counsel-projectile counsel-codesearch counsel-bbdb ample-zen-theme ample-theme)))
 '(pdf-view-midnight-colors (quote ("#FDF4C1" . "#282828")))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(weechat-color-list
   (quote
    (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
