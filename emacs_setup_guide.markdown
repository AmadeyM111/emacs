# Настройка Emacs для работы с текстом и стилями

## 1. Установка Emacs
- Скачайте последнюю версию с [официального сайта](https://www.gnu.org/software/emacs/).
- Установите через пакетный менеджер (например, `sudo apt install emacs` на Ubuntu).

## 2. Настройка базового конфига
- Откройте файл конфигурации: `~/.emacs.d/init.el` (если файла нет, создайте).
- Добавьте базовые настройки:

```elisp
(setq inhibit-startup-screen t) ; Отключает начальный экран
(global-display-line-numbers-mode) ; Включает нумерацию строк
(setq-default tab-width 4) ; Устанавливает ширину табуляции
```

## 3. Установка org-mode
- org-mode встроен, но обновите его: `M-x package-refresh-contents`, затем `M-x package-install RET org RET`.
- Настройте для работы с Markdown: добавьте в `init.el`:

```elisp
(require 'org)
(setq org-export-backends '(md html ascii latex))
```

## 4. Настройка копирования чистого текста
- Добавьте в `init.el` для копирования без стилей:

```elisp
(defun copy-as-plain-text ()
  (interactive)
  (kill-new (buffer-substring-no-properties (region-beginning) (region-end))))
(global-set-key (kbd "C-c C-p") 'copy-as-plain-text)
```

- Используйте `C-c C-p` для копирования, затем вставляйте в Obsidian.

## 5. Кастомизация стилей
- Создайте директорию `~/.emacs.d/custom/` и файл `custom.el`.
- Добавьте правила стилей, например:

```elisp
(custom-set-faces
 '(default ((t (:font "DejaVu Sans" :height 120))))
 '(org-level-1 ((t (:height 1.2)))))
```

- Перезагрузите Emacs: `M-x load-file RET ~/.emacs.d/init.el`.

## 6. Интеграция с Obsidian
- Установите плагин `ob-emacs` (если доступен) или используйте экспорт:
  - Экспортируйте из org-mode в Markdown: `C-c C-e m m`.
  - Копируйте результат и вставляйте в Obsidian.
- Настройте синхронизацию через `org-roam` или ручной экспорт.

## 7. Тестирование и отладка
- Проверьте настройки: `M-x eval-buffer` после изменений.
- Используйте `M-x describe-key` для проверки горячих клавиш.
- Отладку веди через `M-x toggle-debug-on-error`.

## 8. Рекомендации
- Регулярно бэкапьте `init.el`.
- Изучайте документацию: `C-h i` для встроенной помощи.