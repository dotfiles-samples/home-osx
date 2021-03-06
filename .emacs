;;; Set load path

(add-to-list 'load-path "~/.emacs.d/elisp")

;;; Initialize package system
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)


(setq package-selected-packages '(maxframe bar-cursor auctex auto-complete autopair dropdown-list magit markdown-mode apropospriate-theme popup powerline python-mode rainbow-delimiters yasnippet go-autocomplete go-eldoc go-mode exec-path-from-shell helm helm-descbinds ac-helm projectile helm-projectile cider ac-cider ensime flycheck-package yaml-mode puppet-mode))

;;; Suppress redefinition warnings before anything is loaded
(setq ad-redefinition-action 'accept)

;;; Packages to require
(require 'powerline)
(require 'bar-cursor)
(require 'autopair)
(require 'yasnippet)
(require 'markdown-mode)
(require 'auto-complete-config)
(require 'rainbow-delimiters)
(require 'go-autocomplete)
(require 'helm)
(require 'helm-config)
(require 'helm-files)
(require 'helm-grep)
(require 'ac-helm)
(require 'cider)
(require 'cider-eldoc)
(require 'ac-cider)
(require 'helm-descbinds)
(require 'functions)
(require 'keyboard-shortcuts)
(require 'mode-hooks)

;;; Set frame title
(setq frame-title-format
      '("Emacs " emacs-version ": "(:eval (if (buffer-file-name)
                                          (abbreviate-file-name (buffer-file-name))
                                        "%b"))))

;;; Enable modes and window setup
(setq default-directory "~/")
(tool-bar-mode -1)
(scroll-bar-mode -1)
(load-theme 'apropospriate-dark t)
(when (and (window-system) (eq system-type 'darwin))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH")
  (set-face-attribute 'default nil :font "Monaco-14")
  (toggle-frame-fullscreen))
(rainbow-delimiters-mode)
(ac-config-default)
(delete-selection-mode)
(yas/global-mode 1)
(global-linum-mode)
(helm-mode 1)
(helm-descbinds-mode)
(projectile-global-mode)
(global-subword-mode)
(show-paren-mode)
(global-font-lock-mode t)
(mouse-wheel-mode t)
(column-number-mode 1)
(bar-cursor-mode 1)
(autopair-global-mode 1)
(powerline-default-theme)
(add-to-list 'auto-mode-alist '("\\.markdown" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))

;;; General variable customization
(setq initial-major-mode 'text-mode)
(setq c-default-style "bsd")
(setq-default indent-tabs-mode t)
(setq x-select-enable-clipboard t)
(setq inhibit-startup-message t)
(setq mouse-drag-copy-region nil)
(fset 'yes-or-no-p 'y-or-n-p)
(setq read-file-name-completion-ignore-case t)
(setq initial-scratch-message nil)
(setq dired-recursive-deletes 'top)
(setq show-paren-style 'parenthesis)
(setq autopair-autowrap t)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq tramp-backup-directory-alist backup-directory-alist)
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq auto-save-interval 1000)
(setq auto-save-timeout 120)
(setq auto-save-list-file-prefix temporary-file-directory)
(setq require-final-newline t)
(setq projectile-enable-caching t)
(setq ring-bell-function 
      (lambda ()
	(unless (memq this-command
		      '(isearch-abort
			abort-recursive-edit
			exit-minibuffer
			keyboard-quit
			mwheel-scroll
			down
			up
			next-line
			previous-line
			backward-char
			forward-char))
	  (ding))))
(setq magit-last-seen-setup-instructions "1.4.0")
(setq magit-git-executable "/usr/local/bin/git")

;;; Configure helm
(setq helm-scroll-amount 4)
(setq helm-quick-update t)
(setq helm-idle-delay 0.01)
(setq helm-input-idle-delay 0.01)
(setq helm-ff-search-library-in-sexp t)
(setq helm-split-window-default-side 'other)
(setq helm-split-window-in-side-p t)
(setq helm-candidate-number-limit 200)
(setq helm-M-x-requires-pattern 0)
(setq helm-ff-skip-boring-files t)
(setq helm-boring-file-regexp-list
      '("\\`\\." "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./" "\\`\\.git/" "\\.pdf" "\\.class" "\\.pyc" "\\.log" "\\.aux" "\\.nav" "\\.out" "\\.snm" "\\.elc"))
(setq helm-ff-file-name-history-use-recentf t)
(setq helm-move-to-line-cycle-in-source t)
(setq ido-use-virtual-buffers t)
(setq helm-buffers-fuzzy-matching t)
(setq recentf-exclude
      '("COMMIT_EDITMSG" "\\.emacs\\.d/elpa"))

;;; Configure AUCTex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-newline-function 'newline-and-indent)
(setq TeX-PDF-mode t)
(setq TeX-view-program-list '(("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline %n %o %b")))
(setq TeX-view-program-selection '((output-pdf "Skim")))
(setq TeX-auto-local "/tmp/")

;;; Configure org-mode
(setq org-return-follows-link t)
(setq org-startup-folded t)
(setq org-completion-use-ido t)
(setq org-hide-leading-stars t)
(setq org-special-ctrl-a/e t)
(setq org-special-ctrl-k t)
(setq org-blank-before-new-entry '((heading . nil) (plain-list-item . auto)))
(setq org-export-with-LaTeX-fragments t)
(setq org-enforce-todo-dependencies t)

;;; Configure CIDER
(setq nrepl-hide-special-buffers t)

;;; Start the server
(server-start)
