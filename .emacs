;; Package Stuff
(setq package-archive-priorities '(("gnu" . 10)
				   ("melpa" . 5))
      package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

;; UI Stuff
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq inhibit-startup-screen t)
(setq show-trailing-whitespace t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(global-hl-line-mode 1)
(which-key-mode 1)

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

(use-package lsp-mode
  :diminish
  :commands (lsp lsp-deferred)
  :ensure t
  :hook
  (go-ts-mode . lsp-deferred))

(use-package lsp-ui
  :diminish)

(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)

(use-package company
  :diminish company-mode)
