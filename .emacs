
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(custom-safe-themes
   (quote
    ("9c8eabd23f3e14e135be44cd443aac53b068b63e8aeb8221f7e72819d9a3244d" "605228f59118f6667f75e6f64b021733f34653c5847aa178623456365a503f23" "0d07066b70c9f7168516d1c3ba0523aeb9c91cc39d68edbb68eef852dd6a7048" "3f54cc240363b09108d7e94ca21ca7dd2f9bd8d88c8f051d8b2109c351504ac8" "d4199013a5ba813e27f9fcdd9632e629ae55155b9ea945049655868f9d6802c3" "329030b087841121358126705d2cbea4e8bb03f9b2517e4051d6ff23ce51dd5e" "7d74c4507028bafa66a1156c338f717d30ef823229a69145c6fb0d39a1f9ac03" "d1d8b8b403f2cc1eccc8687884f61647a9a0fb384c9f03ae6a6ca6698432c029" "7c1ed27d4220577f9b51174b4e0892d2db04399cb4ed6c30271c5edd5b0b2bd0" "cd15ee5d83973bdef3a8f4667fe768bed2cd9f1a560e6b5a386ef2b1b707fe0b" "2120159f4ddde952b898dbc35e14bb93cbe11ee4eac2500aef098d35bc59df65" "1f8ac746734a024ea0185f9262444395ac731dafe809dfc092204a21aef6324a" "a7eda2d2bb188cff0ca531f21400cdda1086a995ee0e5977b7cee04725554865" "85333bbc9ef841c28c74513c4766df526cf8c64e1d102f2d5b8657ea7a16ac37" "6acf4031c95db1112b9046911e485a91d3141982e2493111a8cc2517dfd8a0a8" "f4de38901fed307bfeb397835a5f69f7eef42cca8b2dba3c79c1e7a610e2689a" "359f3e0fcedb6cb3ccec9b45f08d1dd6e9160e7f64651ccd82a681121007d8ad" "a3aff790f55311775225b37febc73d9f9e18be4da431b27a6053d3baa686c665" "721bb3cb432bb6be7c58be27d583814e9c56806c06b4077797074b009f322509" "946e871c780b159c4bb9f580537e5d2f7dba1411143194447604ecbaf01bd90c" "962dacd99e5a99801ca7257f25be7be0cebc333ad07be97efd6ff59755e6148f" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(default-frame-alist (quote ((vertical-scroll-bars))))
 '(frame-background-mode (quote dark))
 '(initial-frame-alist (quote ((vertical-scroll-bars))))
 '(menu-bar-mode nil)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://stable.melpa.org/packages/"))))
 '(scroll-bar-mode nil)
 '(send-mail-function (quote mailclient-send-it))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;-------------------------------------------------------------------------------- EMACS js2 mode ------------------------------------------------------------------------------------
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;;-------------------------------------------------------------------------------- EMACS Rust-mode ------------------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/rust-mode/")
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;;-------------------------------------------------------------------------------- EMACS basic visual & additional functionality -------------------------------------------------------
(setq make-backup-files nil) ;;backup ~ files removed
;;(global-linum-mode t) ;; enable line numbers

;;-------------------------------------------------------------------------------- EMACS language specific & text editing improvements -------------------------------------------------

;;(electric-pair-mode 1)
(electric-indent-mode 1)

;;enable auto indentation on c/c++
(define-key global-map (kbd "RET") 'newline-and-indent)

;;-------------------------------------------------------------------------------- EMACS C++/C-language tweaks / extra functionality ------------------------------------------------------------
;;CC mode modification
(setq c-default-style "bsd"
      c-basic-offset 4
      tab-width 4
      indent-tabs-mode nil)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;;switch case indentation
(add-hook 'c-mode-common-hook
          (lambda ()
            (c-set-offset 'case-label '+)))

;;hightlight keywords for organization
(setq fixme-modes '(c++-mode c-mode emacs-lisp-mode))
(make-face 'font-lock-fixme-face)
(make-face 'font-lock-note-face)
(mapc (lambda (mode)
        (font-lock-add-keywords
         mode
         '(("\\<\\(TODO\\)" 1 'font-lock-fixme-face t)
           ("\\<\\(NOTE\\)" 1 'font-lock-note-face t))))
      fixme-modes)
(modify-face 'font-lock-fixme-face "Red" nil nil t nil t nil nil)
(modify-face 'font-lock-note-face "Dark Green" nil nil t nil t nil nil)

;;switch between header and source
(add-hook 'c-mode-common-hook
          (lambda() 
            (local-set-key  (kbd "C-c o") 'ff-find-other-file)))


;;--------------------------------------------------------------------------------- EMACS text editing improvements -------------------------------------------------------------------
;; horizontal scrolling
(if (boundp 'truncate-lines)
    (setq-default truncate-lines t) ; always truncate
  (progn
    (hscroll-global-mode t)
    (setq hscroll-margin 1)
    (setq auto-hscroll-mode 1)
    (setq automatic-hscrolling t)
   ))

;;--------------------------------------------------------------------------- EMACS Haskell Mode -------------------------------------------------------------------------------------
;;haskell mode hook
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
 
;;---------------------------------------------------------------------------- EMACS Theme Color ---------------------------------------------------------------------------------------
;;theme loading
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")
;;(load-theme 'solarized t)

;;(add-to-list 'default-frame-alist '(alpha 85 85))

(set-default-font "Liberation Mono-11.5")

(defun handmade-scheme()
  (interactive)
  (set-foreground-color "#DEC896")
  (set-background-color "#222222")
  (set-cursor-color "#40FF40")
  (set-face-attribute 'font-lock-builtin-face nil :foreground "#DEC896")
  (set-face-attribute 'font-lock-comment-face nil :foreground "gray50")
  (set-face-attribute 'font-lock-constant-face nil :foreground "olive drab")
  (set-face-attribute 'font-lock-doc-face nil :foreground "gray50")
  (set-face-attribute 'font-lock-function-name-face nil :foreground "#DEC896")
  (set-face-attribute 'font-lock-keyword-face nil :foreground "DarkGoldenrod3")
  (set-face-attribute 'font-lock-string-face nil :foreground "olive drab")
  (set-face-attribute 'font-lock-type-face nil :foreground "#DEC896")
  (set-face-attribute 'font-lock-variable-name-face nil :foreground "#DEC896"))

;;--------------------------------------------------------------------------- EMACS custom command -----------------------------------------------------------------------------------
(defun make-without-asking ()
  "Make the current build. Only works on Windows only (.batch)"
  (interactive)
  (compile "build.bat")
  (other-window 1))
(define-key global-map "\em" 'make-without-asking)

;;-------------------------------------------------------------------------- scrolling fix --------------------------------------------------------------------------------------
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)

;;-------------------------------------------------------------------------- Ido mode/fold blocks --------------------------------------------------------------------------------------
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;;-------------------------------------------------------------------------- shortcut for imenu   --------------------------------------------------------------------------------------
(define-key global-map "\ej" 'imenu)
;;-------------------------------------------------------------------------- enable semantic mode --------------------------------------------------------------------------------------
;;(semantic-mode 1) 

;;-------------------------------------------------------------------------- untabify file mode --------------------------------------------------------------------------------------
(defun save-buffer-untabified ()
  "Save the buffer after untabifying it."
  (interactive)
  (save-excursion
    (save-restriction
      (widen)
      (untabify (point-min) (point-max))))
  (save-buffer))
(define-key global-map "\es" 'save-buffer-untabified)

;;-------------------------------------------------------------------------- color scheme choice --------------------------------------------------------------------------------------
(handmade-scheme)

;;------------------------------------------------------------------------- Grep Command -------------------------------------------------------------------
(setenv "PATH"
  (concat
   ;; Change this with your path to MSYS bin directory
   "C:\\MinGW\\msys\\1.0\\bin;"
   (getenv "PATH")))

(set-face-background `mode-line "#DEC896")
(set-face-foreground `mode-line "#222222")
(global-hl-line-mode 1)
(set-face-background 'hl-line "midnight blue")
