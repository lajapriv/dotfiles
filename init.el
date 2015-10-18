;; (setq debug-on-error t)

;; (setq load-prefer-newer t)

(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

(when (executable-find "/system/bin/getprop")
  (setq shell-file-name "/data/data/com.termux/files/usr/bin/sh")
  (setq my_shell_output
	(substring
	 (shell-command-to-string "getprop ro.product.model")
	 0 -1))

  (setq Info-directory-list '("/data/data/com.termux/files/usr/share/emacs/24.5/info"))

  (run-with-timer 0 1 'redraw-display)

  (defun resize ()
    (interactive)
    (if (eq (frame-height) 17)
	(set-frame-height (selected-frame) 26)
      (set-frame-height (selected-frame) 17)))
  (global-set-key (kbd "C-x w") 'resize))

;; disable the beep
(setq visible-bell 1)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(require 'helm-config)
(helm-mode 1)
(require 'yasnippet)
(yas-global-mode 1)
(ac-config-default)
(setq ac-stop-flymake-on-completing nil)
;; (add-hook 'window-setup-hook 'ac-config-default)
;; (debug-on-entry 'ac-config-default)
;; (debug-on-entry 'setenv-internal)
;; (debug-on-entry 'normal-top-level)
;; (debug-on-entry 'do-after-load-evaluation)
;; (debug-on-entry 'load-history-filename-element)

; enable 'a' to open directory or file in the same buffer in Dired mode
; NOTE: if i want to expand this to reuse Dired buffers for all motion, e.g. ^
; to move up to the parent directory, see
; http://www.emacswiki.org/emacs/DiredReuseDirectoryBuffer
(put 'dired-find-alternate-file 'disabled nil)
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(setq dired-dwim-target t)

