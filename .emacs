(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

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

(use-package counsel
  :ensure t
  :config
  (counsel-projectile-mode))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package evil-escape
  :ensure t
  :config
  (evil-escape-mode t)
  (setq-default evil-escape-key-sequence "kj"))

(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "a" 'counsel-projectile-ag
    "b" 'eval-buffer
    "e" 'find-file
    "f" 'counsel-projectile
    "k" 'kill-buffer
    "m" 'er-switch-to-previous-buffer
    "o" 'ivy-switch-buffer
    "r" 'counsel-recentf
    "s" 'swiper
    "v" 'magit))

(use-package php-mode
  :ensure t)

(use-package evil-commentary
  :ensure t
  :config
  (evil-commentary-mode))

(use-package monokai-theme
  :ensure t)

(use-package paganini-theme
  :ensure t)

(use-package spacegray-theme
  :ensure t)

(use-package base16-theme
  :ensure t)

(use-package airline-themes
  :ensure t)

(use-package telephone-line
  :ensure t)

;; (setq telephone-line-primary-left-separator 'telephone-line-cubed-left
;;       telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left
;;       telephone-line-primary-right-separator 'telephone-line-cubed-right
;;       telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-right)
;; (setq telephone-line-height 16
;;       telephone-line-evil-use-short-tag t)
;; (telephone-line-mode 1)
     
(setq telephone-line-primary-left-separator 'telephone-line-flat
      telephone-line-secondary-left-separator 'telephone-line-flat
      telephone-line-primary-right-separator 'telephone-line-flat
      telephone-line-secondary-right-separator 'telephone-line-flat)
(setq telephone-line-height 16
      telephone-line-evil-use-short-tag t)
(telephone-line-mode 1)


(use-package ox-twbs
  :ensure t)

(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "M-o") 'ace-window))

(use-package org
  :ensure t)

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
;; (require 'powerline)
;; (powerline-nano-theme)

;; disable bold font face
;; bold makes me angry
 (mapc
  (lambda (face)
    (set-face-attribute face nil :weight 'normal :underline nil))
  (face-list))

;; auto php mode on inc files (moma yeah)
(add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))

;; auto tail mode on logs
(add-to-list 'auto-mode-alist '("\\.log\\'" . auto-revert-tail-mode))

(defun er-switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" "b563a87aa29096e0b2e38889f7a5e3babde9982262181b65de9ce8b78e9324d5" "003a9aa9e4acb50001a006cfde61a6c3012d373c4763b48ceb9d523ceba66829" "d61f6c49e5db58533d4543e33203fd1c41a316eddb0b18a44e0ce428da86ef98" "840db7f67ce92c39deb38f38fbc5a990b8f89b0f47b77b96d98e4bf400ee590a" "1b27e3b3fce73b72725f3f7f040fd03081b576b1ce8bbdfcb0212920aec190ad" "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" "3eb93cd9a0da0f3e86b5d932ac0e3b5f0f50de7a0b805d4eb1f67782e9eb67a4" "721bb3cb432bb6be7c58be27d583814e9c56806c06b4077797074b009f322509" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" "eae831de756bb480240479794e85f1da0789c6f2f7746e5cc999370bbc8d9c8a" "85e6bb2425cbfeed2f2b367246ad11a62fb0f6d525c157038a0d0eaaabc1bfee" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "e1498b2416922aa561076edc5c9b0ad7b34d8ff849f335c13364c8f4276904f0" "4138944fbed88c047c9973f68908b36b4153646a045648a22083bd622d1e636d" "8d805143f2c71cfad5207155234089729bb742a1cb67b7f60357fdd952044315" "13131de3a7fdb8f2ff490f2ec708aeafeb8929237bdafef729056b4380311c32" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default)))
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
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (phpunit phpcbf dumb-jump magit-svn evil-magit moe-theme airline-themes powerline ace-window ujelly-theme spacegray-theme use-package telephone-line smyx-theme powerline-evil php-mode paganini-theme ox-twbs monokai-theme markdown-mode helm-projectile helm-ag hc-zenburn-theme evil-visual-mark-mode evil-surround evil-leader evil-escape evil-commentary darktooth-theme counsel-projectile counsel-codesearch counsel-bbdb ample-zen-theme ample-theme)))
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
