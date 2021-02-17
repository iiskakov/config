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

(setq doom-themes-treemacs-theme "doom-plain-dark")
(setq doom-theme 'dichromacy)
(setq doom-font (font-spec :family "Fira Code" :size 14))
(setq doom-big-font (font-spec :family "Fira Code" :size 20))

(setq company-idle-delay 0)

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

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
;; Tide configuring end
;;

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


(global-set-key (kbd "§") #'+vterm/toggle)
(map! "§" #'+vterm/toggle)

;; (global-set-key (kbd "<tab>") #'+treemacs/toggle)
;; (map! "<tab>" #'+treemacs/toggle)

(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(blink-cursor-mode 1)


