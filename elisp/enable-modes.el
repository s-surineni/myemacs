(setq-default indent-tabs-mode nil)
;; configuration for auto complete mode
(global-set-key (kbd "<backtab>") 'auto-complete)
(global-auto-complete-mode t)
(setq ac-ignore-case nil)
(ac-config-default)
(setq ac-delay 0)
(setq ac-disable-faces nil)
(add-to-list 'ac-modes 'fundamental-mode
	     'markdown-mode)
;; ido mode
(ido-mode 1)
(ido-everywhere t)
(setq ido-use-faces nil)
(flx-ido-mode t)			;enables fuzzy matching
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
;; ido vertical mode
(ido-vertical-mode 1)

;; magit mode
(global-set-key (kbd "C-x g") 'magit-status)
;; projectile
(projectile-global-mode)
(global-set-key (kbd "C-h") 'projectile-find-file)

;; multiple-cursors mode
(require 'multiple-cursors)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;; smartparens
;; gets the default config
(require 'smartparens-config)
;; enables smartparens everywhere
(smartparens-global-mode t)
;; shows parens when at parens
(show-smartparens-global-mode +1)
;; (setq sp-pair-overlay-face ((t (:inherit nil))))

;; typescript-mode
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; swiper mode
;; (global-set-key "\C-s" 'swiper)
(add-to-list 'auto-mode-alist '("\\.gradle\\'" . groovy-mode))
