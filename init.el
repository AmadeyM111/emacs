(require 'package)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ;; ("melpa" . "https://melpa.org/packages/")
        ("local" . "~/.emacs.d/elpa/archives/gnu")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Настройки интерфейса и видимости
(setq inhibit-startup-screen t)
(global-display-line-numbers-mode)
(setq-default tab-width 4)

;; Подключение org и расширений
(require 'org)
(setq org-export-backends '(md html ascii latex))

;; Горячая клавиша для копирования без форматирования
(defun copy-as-plain-text ()
  (interactive)
  (kill-new (buffer-substring-no-properties (region-beginning) (region-end))))
(global-set-key (kbd "C-c C-p") 'copy-as-plain-text)

;; Пример шрифта и темы
(set-face-attribute 'default nil :font "montserrat" :height 120)
(load-theme 'modus-operandi t)

;; Установка и настройка org-modern через use-package
(use-package org-modern
  :ensure t
  :after org
  :config
  (global-org-modern-mode))
