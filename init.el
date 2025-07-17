(setq inhibit-startup-screen t) ; Отключает начальный экран
(global-display-line-numbers-mode) ; Включает нумерацию строк
(setq-default tab-width 4) ; Устанавливает ширину табуляции

(require 'org)
(setq org-export-backends '(md html ascii latex))

(defun copy-as-plain-text ()
  (interactive)
  (kill-new (buffer-substring-no-properties (region-beginning) (region-end))))
(global-set-key (kbd "C-c C-p") 'copy-as-plain-text)
