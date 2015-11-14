;; -*- origami-fold-style: triple-braces -*-

;;;; debug {{{
;; (setq debug-on-error t)
;; (setq load-prefer-newer t)
;;;; }}}

;;;; android specific settings {{{
(when (executable-find "/system/bin/getprop")
  (setq shell-file-name "/data/data/com.termux/files/usr/bin/sh")
  ;; (setq my_shell_output
  ;;       (substring
  ;;        (shell-command-to-string "getprop ro.product.model")
  ;;        0 -1))

  (setq Info-directory-list '("/data/data/com.termux/files/usr/share/emacs/24.5/info"))

  (run-with-timer 0 1 'redraw-display)

  (defun resize ()
    (interactive)
    (if (eq (frame-height) 17)
        (set-frame-height (selected-frame) 26)
      (set-frame-height (selected-frame) 17)))

  (global-set-key (kbd "C-x w") 'resize))
;;;;}}}

;;;; misc {{{
;; disable menu, toolbar and scrollbar
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; hide startup message
(setq inhibit-startup-screen t)
;; show nothing in *scratch* when started
(setq initial-scratch-message nil)
(setq visible-bell 1)                   ; disable the beep
(setq-default indent-tabs-mode nil)     ; indent with spaces not tabs
(column-number-mode 1)                  ; column number in the mode line
(show-paren-mode 1)                     ; show matching parentheses
;;;;}}}

;;;; safe local variables {{{
(add-to-list 'safe-local-variable-values '(origami-fold-style . triple-braces))
;;;;}}}

;;;; package {{{
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;;;;}}}

;;;; ido {{{
;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (require 'ido-vertical-mode)
;; (ido-mode 1)
;; (ido-vertical-mode 1)
;; (require 'ido-ubiquitous)
;; (ido-ubiquitous-mode 1)
;;;;}}}

;;;; helm {{{
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(setq helm-mode-fuzzy-match t)
(setq helm-completion-in-region-fuzzy-match t)
(helm-mode 1)
(helm-autoresize-mode 1)
(setq helm-autoresize-min-height 50)
(setq helm-autoresize-max-height 50)
;;;;}}}

;;;; yasnippet {{{
(require 'yasnippet)
(yas-global-mode 1)
;;;;}}}

;;;; auto-complete {{{
(ac-config-default)
(setq ac-stop-flymake-on-completing nil)
;;;; debug auto-complete
;; (add-hook 'window-setup-hook 'ac-config-default)
;; (debug-on-entry 'ac-config-default)
;; (debug-on-entry 'setenv-internal)
;; (debug-on-entry 'normal-top-level)
;; (debug-on-entry 'do-after-load-evaluation)
;; (debug-on-entry 'load-history-filename-element)
;;;;}}}

;;;; dired {{{
;; enable 'a' to open directory or file in the same buffer in Dired mode
;; NOTE: if i want to expand this to reuse Dired buffers for all motion, e.g. ^
;; to move up to the parent directory, see
;; http://www.emacswiki.org/emacs/DiredReuseDirectoryBuffer
(put 'dired-find-alternate-file 'disabled nil)
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(setq dired-dwim-target t)
;;;;}}}

;;;; imenu devide the file into major sections {{{
(defun imenu-elisp-sections ()
  (setq imenu-prev-index-position-function nil)
  (add-to-list 'imenu-generic-expression '("Sections" "^;;;; \\(.+\\)$" 1) t))

(add-hook 'emacs-lisp-mode-hook 'imenu-elisp-sections)
;;;;}}}

;;;; origami {{{
(require 'origami)
(global-origami-mode)
(global-set-key (kbd "C-c TAB") 'origami-recursively-toggle-node)
(global-set-key (kbd "C-c -") 'origami-toggle-all-nodes)
(global-set-key (kbd "C-c =") 'origami-show-only-node)
;;;;}}}
