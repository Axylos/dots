(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure 't)

(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)

(defalias 'yes-or-no-p 'y-or-n-p)

(use-package exotica-theme
	     :config (load-theme 'exotica t))

(setq visible-cursor nil)
(setq inhibit-splash-screet t)
(transient-mark-mode 1)

(require 'org)
(setq org-todo-keywords
      '((sequence "TODO(t)" "PROGRESS(p!)" "DONE(d@)" "ABANDONED(a@)" "BLOCKED(b@)")))

(setq org-todo-keyword-faces
      '( ("PROGRESS" . "yellow")
	("DONE" . (:foreground "steelblue" :weight "bold"))
	("ABANDONED" . (:foreground "red" :weight "bold"))
	("BLOCKED" . (:foreground "purple" :weight "bold"))))


(setq gnus-init-file "~/.gnus.el")
(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
         (column (c-langelem-2nd-pos c-syntactic-element))
         (offset (- (1+ column) anchor))
         (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

(dir-locals-set-class-variables
 'linux-kernel
 '((c-mode . (
        (c-basic-offset . 8)
        (c-label-minimum-indentation . 0)
        (c-offsets-alist . (
                (arglist-close         . c-lineup-arglist-tabs-only)
                (arglist-cont-nonempty .
                    (c-lineup-gcc-asm-reg c-lineup-arglist-tabs-only))
                (arglist-intro         . +)
                (brace-list-intro      . +)
                (c                     . c-lineup-C-comments)
                (case-label            . 0)
                (comment-intro         . c-lineup-comment)
                (cpp-define-intro      . +)
                (cpp-macro             . -1000)
                (cpp-macro-cont        . +)
                (defun-block-intro     . +)
                (else-clause           . 0)
                (func-decl-cont        . +)
                (inclass               . +)
                (inher-cont            . c-lineup-multi-inher)
                (knr-argdecl-intro     . 0)
                (label                 . -1000)
                (statement             . 0)
                (statement-block-intro . +)
                (statement-case-intro  . +)
                (statement-cont        . +)
                (substatement          . +)
                ))
        (indent-tabs-mode . t)
        (show-trailing-whitespace . t)
        ))))

(dir-locals-set-directory-class
 (expand-file-name "~/code/kernels")
 'linux-kernel)
(electric-pair-mode 1)
;; make electric-pair-mode work on more brackets
(setq electric-pair-pairs
      '(
        (?\" . ?\")
        (?\{ . ?\})))
    (setq-default c-basic-offset 8)


(setq c-default-style "linux")
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(add-hook 'message-mode (
			 lambda () (
				    setq-local truncate-lines f)))

(setq magit-diff-auto-show nil)
