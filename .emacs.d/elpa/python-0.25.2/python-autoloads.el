;;; python-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (python-mode run-python) "python" "python.el" (22368
;;;;;;  50671 0 0))
;;; Generated autoloads from python.el

(add-to-list 'auto-mode-alist (cons (purecopy "\\.pyw?\\'") 'python-mode))

(add-to-list 'interpreter-mode-alist (cons (purecopy "python[0-9.]*") 'python-mode))

(autoload 'run-python "python" "\
Run an inferior Python process.

Argument CMD defaults to `python-shell-calculate-command' return
value.  When called interactively with `prefix-arg', it allows
the user to edit such value and choose whether the interpreter
should be DEDICATED for the current buffer.  When numeric prefix
arg is other than 0 or 4 do not SHOW.

For a given buffer and same values of DEDICATED, if a process is
already running for it, it will do nothing.  This means that if
the current buffer is using a global process, the user is still
able to switch it to use a dedicated one.

Runs the hook `inferior-python-mode-hook' after
`comint-mode-hook' is run.  (Type \\[describe-mode] in the
process buffer for a list of commands.)

\(fn &optional CMD DEDICATED SHOW)" t nil)

(autoload 'python-mode "python" "\
Major mode for editing Python files.

\\{python-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("python-pkg.el") (22368 50671 300000 0))

;;;***

(provide 'python-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; python-autoloads.el ends here
