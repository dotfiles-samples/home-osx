(require 'package)
(require 'cl)
(add-to-list 'package-archives 
	     '("marmalade" .
	       "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(setq url-http-attempt-keepalives nil)

(defvar ajsquared-packages
  '(maxframe bar-cursor auctex auto-complete autopair dropdown-list magit markdown-mode zenburn-theme popup powerline python-mode rainbow-delimiters yasnippet go-autocomplete go-eldoc go-mode env-var-import helm helm-descbinds ac-helm projectile helm-projectile cider ac-cider ensime)
  "A list of packages to ensure are installed at launch.")

(defun ajsquared-packages-installed-p ()
  (loop for p in ajsquared-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (ajsquared-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p ajsquared-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'package-install)