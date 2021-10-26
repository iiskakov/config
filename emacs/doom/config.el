;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Iskander Iskakov"
      user-mail-address "tradeshells@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

;; (setq doom-themes-treemacs-theme "dichromacy-theme")
;; (setq doom-theme 'doom-plain)
(setq doom-font (font-spec :family "Fira Code" :size 14))
(setq doom-big-font (font-spec :family "Fira Code" :size 20))

;; ;; yasnippet
;; (add-to-list 'load-path
;;           "~/.emacs.d/plugins/yasnippet")
;; (require 'yasnippet)
;; (yas-global-mode 1)

;; (setq company-idle-delay 1)
;; (setq comp-async-jobs-number 24)
;; (setq lsp-idle-delay 0.500)

;; (defcustom lsp-enable-snippet t
;;   "Enable/disable snippet completion support."
;;   :group 'lsp-mode
;;   :type 'boolean)

(when (get-buffer "*format-all-errors*")
  (kill-buffer "*format-all-errors*"))

(global-hl-line-mode 1)
(column-number-mode 1)

;; ;; Add yasnippet support for all company backends
;; ;; https://github.com/syl20bnr/spacemacs/pull/179
;; (defvar company-mode/enable-yas t "Enable yasnippet for all backends.")

;; (defun company-mode/backend-with-yas (backend)
;;   (if (or (not company-mode/enable-yas) (and (listp backend)    (member 'company-yasnippet backend)))
;;   backend
;; (append (if (consp backend) backend (list backend))
;;         '(:with company-yasnippet))))

;; (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
;;
;;

;; ;; Completion
;; ;; Give a change to company-mode
;; (require 'company)
;; (add-hook 'after-init-hook 'global-company-mode)
;; (setq company-dabbrev-other-buffers t
;;       company-dabbrev-code-other-buffers t
;;       company-complete-number t
;;       company-show-numbers t
;;       company-minimum-prefix-length 2
;;       company-dabbrev-downcase nil
;;       company-dabbrev-ignore-case t
;;       company-idle-delay 0.1)


;; (setq company-transformers '(company-sort-by-occurrence))

;; Tide configuring start
;;
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

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

;; (use-package tide
;;   :ensure t
;;   :after (rjsx-mode company flycheck)
;;   :hook (rjsx-mode . setup-tide-mode))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
;; Tide configuring end
;;

(defun 42-ftw ()
  (let* ((banner '(
"        :::      ::::::::"
"      :+:      :+:    :+:"
"    +:+ +:+         +:+  "
"  +#+  +:+       +#+     "
"#+#+#+#+#+   +#+         "
"     #+#    #+#          "
"    ###   ##########     "))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat line (make-string (max 0 (- longest-line (length line))) 32)))
               "\n"))
     'face 'doom-dashboard-banner)))

(setq +doom-dashboard-ascii-banner-fn #'42-ftw)



;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documets/org")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `nil)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


(after! org
  (map! :map org-mode-map
        :n "M-j" #'org-metadown
        :n "M-k" #'org-metaup))



;; (defconst doom-frame-transparency 90)
;; (set-frame-parameter (selected-frame) 'alpha doom-frame-transparency)
;; (add-to-list 'default-frame-alist `(alpha . ,doom-frame-transparency))
;; (defun dwc-smart-transparent-frame ()
;;   (set-frame-parameter
;;     (selected-frame)
;;     'alpha (if (frame-parameter (selected-frame) 'fullscreen)
;;               100
;;              doom-frame-transparency)))

(after! evil
  (setq evil-ex-substitute-global t     ; I like my s/../.. to by global by default
        evil-move-cursor-back nil       ; Don't move the block cursor when toggling insert mode
        evil-kill-on-visual-paste nil)) ; Don't put overwritten text in the kill ring



(evil-goggles-mode)
(global-hl-line-mode -1)

(after! org
  (add-to-list 'org-export-backends 'latex))

(add-to-list 'exec-path "/Library/Tex/texbin")

(after! org
  (setq org-agenda-files '("~/Documents/org/inbox.org")))


; (setq initial-frame-alist '((top . 5) (left . 5) (width . 202) (height . 62))) ; Default window size
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(delete-selection-mode 1)                         ; Replace selection when inserting text
(display-time-mode 1)                             ; Enable time in the mode-line
(unless (equal "Battery status not available"
               (battery))
  (display-battery-mode 1))                       ; On laptops it's nice to know how much power you have


(setq-default
 delete-by-moving-to-trash t                      ; Delete files to trash
 window-combination-resize t                      ; take new window space from all other windows (not just current)
 x-stretch-cursor t)                              ; Stretch cursor to the glyph width

(setq undo-limit 80000000                         ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                         ; Nobody likes to loose work, I certainly don't
      truncate-string-ellipsis "…")               ; Unicode ellispis are nicer than "...", and also save /precious/ space

(setq +ivy-buffer-preview t)
(custom-set-faces!
  '(doom-modeline-buffer-modified :foreground "orange"))

(setq deft-directory "~/Documents/notes"
      deft-extentions '("org" "txt")
      deft-recursive t)

(global-subword-mode 1)

(defun configure-prettify-symbols-alist ()
  "Set prettify symbols alist."
  (setq prettify-symbols-alist '(("lambda" . ?λ)
                                 ("->" . ?→)
                                 ("->>" . ?↠)
                                 ("=>" . ?⇒)
                                 ("map" . ?↦)
                                 ("/=" . ?≠)
                                 ("!=" . ?≠)
                                 ("==" . ?≡)
                                 ("<=" . ?≤)
                                 (">=" . ?≥)
                                 ("<=<" . ?↢)
                                 (">=>" . ?↣)
                                 ("&&" . ?∧)
                                 ("||" . ?∨)
                                 ("not" . ?¬))))

;; (prettify-symbols-mode t)

(after! processing-mode-hook
  (setq processing-location "/usr/local/bin/processing-java")
  (setq processing-application-dir "/Applications/Processing.app")
  (setq processing-sketchbook-dir "~/Documents/Processing"))

(setq vterm-shell "/usr/local/bin/fish")

(global-set-key (kbd "§") #'+vterm/toggle)
(map! "§" #'+vterm/toggle)

(map! :leader "z" #'evil-switch-to-windows-last-buffer)

(if (not (display-graphic-p))
    (progn
      ;; 增大垃圾回收的阈值，提高整体性能（内存换效率）
      (setq gc-cons-threshold (* 8192 8192))
      ;; 增大同LSP服务器交互时的读取文件的大小
      (setq read-process-output-max (* 1024 1024 128)) ;; 128MB
      ))

(global-auto-revert-mode t)

(blink-cursor-mode 1)


(setq-default line-spacing 0.5)

(setq hour
      (string-to-number
       (substring (current-time-string) 11 13))) ;; gets the hour
(if (member hour (number-sequence 6 16)) ;; if between 06:00-16:59
    (setq now 'doom-plain) ;; then light theme
  (setq now 'doom-plain-dark)) ;; else dark theme from 17:00
(if (equal now doom-theme) ;; only switches to the correct theme if needed
    nil
  (setq doom-theme now))

(defun kill-format-all-buffer ()
  (if (get-buffer "*format-all-errors*")
        (let ((kill-buffer-query-functions nil))
                (kill-buffer "*format-all-errors*")
                (other-window 1)
                (if (not (one-window-p))
                  (delete-window))
        )))

(add-hook 'after-save-hook #'kill-format-all-buffer)

;; (add-hook 'treemacs-mode-hook (lambda () (text-scale-decrease 1.3)))
(setq treemacs-width 24)

 (setq +doom-dashboard-menu-sections
    '(
      ("Reload last session"
      :icon (all-the-icons-octicon "history" :face 'doom-dashboard-menu-title)
      :when (cond ((require 'persp-mode nil t)
                    (file-exists-p (expand-file-name persp-auto-save-fname persp-save-dir)))
                  ((require 'desktop nil t)
                    (file-exists-p (desktop-full-file-name))))
      :face (:inherit (doom-dashboard-menu-title bold))
      :action doom/quickload-session)
      ;; ("Recently opened files"
      ;; :icon (all-the-icons-octicon "file-text" :face 'doom-dashboard-menu-title)
      ;; :action recentf-open-files)
      ("Open project"
      :icon (all-the-icons-octicon "briefcase" :face 'doom-dashboard-menu-title)
      :action projectile-switch-project)
      ))

;; my pinkie hurts
;; also i use line selection more often than char selection
(define-key evil-normal-state-map (kbd  "v") 'evil-visual-line)
(define-key evil-normal-state-map (kbd "V") 'evil-visual-char)

(define-key evil-visual-state-map (kbd "v") 'evil-visual-line)
(define-key evil-visual-state-map (kbd "V") 'evil-visual-char)

(advice-add 'evil-ex-search-next :after
            (lambda (&rest x) (evil-scroll-line-to-center (line-number-at-pos))))
(advice-add 'evil-ex-search-previous :after
            (lambda (&rest x) (evil-scroll-line-to-center (line-number-at-pos))))

(setq evil-mode-line-format nil
      evil-insert-state-cursor '(bar "Orange")
      evil-visual-state-cursor '(box "#F86155"))

;; Testing to find out whether it'll allow me to autocomplete snippets
(use-package! company
  :config
  (setq
   company-idle-delay 0.1
   company-minimum-prefix-length 5))



(map! :n "TAB" #'indent-for-tab-command)

;; Don't show encoding in mode line
(setq
 doom-modeline-buffer-encoding 'nil
 +modeline-encoding 'nil)

;; Helps with "vim'ing" words in camelCase
(global-superword-mode 1)

(provide 'config)
;;; config.el ends here
