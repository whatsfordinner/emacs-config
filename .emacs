;;; .emacs --- init file for emacs -*- lexical-binding: nil -*-

;;; Commentary:
;; meant for use across workstations
;; cobbled together from reddit and futzing around

;;; Code:
;; package archives
(setq package-archive-priorities '(("gnu" . 10)
				   ("melpa" . 5))
      package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

;; filetype associations
(setq auto-mode-alist
      (append
       '(("\\.go'" . go-ts-mode)
	 ("go\\.mod\\'" . go-ts-mode)
	 ("\\.py\\'" . python-ts-mode))
       auto-mode-alist))

;; ui stuff
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq inhibit-startup-screen t)
(setq show-trailing-whitespace t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(global-hl-line-mode 1)
(which-key-mode 1)

;; tokyo night theme because i'm basic af
(use-package tokyo-night
  :vc (:url "https://github.com/bbatsov/tokyo-night-emacs" :rev :newest)
  :config
  (load-theme 'tokyo-night t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(company lsp-mode lsp-ui magit tokyo-night))
 '(package-vc-selected-packages
   '((tokyo-night :url "https://github.com/bbatsov/tokyo-night-emacs"))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; lsp config
(use-package lsp-mode
  :diminish
  :commands (lsp lsp-deferred)
  :ensure t
  :custom
  (lsp-keymap-prefix "C-c C-l")
  :hook ((go-ts-mode . lsp-deferred)
	 (python-ts-mode . lsp-deferred)))

(use-package flycheck
  :diminish
  :ensure t
  :hook ((after-init . global-flycheck-mode)
	 (after-init . global-flycheck-annotate-mode))
  :config
  (global-flycheck-lsp-mode t))

(use-package lsp-ui
  :diminish
  :commands (lsp-ui-mode)
  :ensure t
  :custom
  (lsp-ui-peek enable t)
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-show-with-cursor t)
  (lsp-ui-doc-position 'at-point)
  (lsp-ui-doc-delay 0.2)
  (lsp-ui-doc-side 'right)
  :hook (lsp-mode . lsp-ui-mode))

(use-package company
  :diminish company-mode
  :ensure t)

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

(provide '.emacs)
;;; .emacs ends here
