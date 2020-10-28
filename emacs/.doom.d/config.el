;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(menu-bar-mode 1)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Francesco Alemanno"
      user-mail-address "francescoalemanno710@gmail.com")

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
;; (setq doom-theme 'doom-one)

(setq doom-theme 'doom-palenight)
(delq! t custom-theme-load-path)


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq diary-file "~/org/diary.org")


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


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

;(setq yas-triggers-in-field t)

;;

(setq evil-want-fine-undo t)
(global-visual-line-mode t)
(add-hook 'pdf-tools-enabled-hook #'pdf-view-midnight-minor-mode)
;;(add-hook 'pdf-tools-enabled-hook #'pdf-view-auto-slice-minor-mode) ;; it is nice to have, but it is glitchy
(add-hook 'pdf-tools-enabled-hook #'pdf-view-fit-width-to-window)

(setq doom-font (font-spec :family "Hack" :size 14 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Hack" :size 14))

(defun fa-org-conf ()
  (interactive)
  (require 'ox-latex)
  (setq org-src-fontify-natively t)
  (setq org-export-with-email t)
  (add-to-list 'org-latex-classes
        '("koma-article"
             "\\documentclass{scrartcl}
              \\usepackage{amsthm}
              \\newtheorem{theorem}{Theorem}
              \\newtheorem{definition}{Definition}
              \\newtheorem{proposition}{Proposition}
              \\newtheorem{remark}{Remark}
\\makeatletter
\\DeclareOldFontCommand{\\rm}{\\normalfont\\rmfamily}{\\mathrm}
\\DeclareOldFontCommand{\\sf}{\\normalfont\\sffamily}{\\mathsf}
\\DeclareOldFontCommand{\\tt}{\\normalfont\\ttfamily}{\\mathtt}
\\DeclareOldFontCommand{\\bf}{\\normalfont\\bfseries}{\\mathbf}
\\DeclareOldFontCommand{\\it}{\\normalfont\\itshape}{\\mathit}
\\DeclareOldFontCommand{\\sl}{\\normalfont\\slshape}{\\@nomath\\sl}
\\DeclareOldFontCommand{\\sc}{\\normalfont\\scshape}{\\@nomath\\sc}
\\makeatother
"
             ("\\section{%s}" . "\\section*{%s}")
             ("\\subsection{%s}" . "\\subsection*{%s}")
             ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
             ("\\paragraph{%s}" . "\\paragraph*{%s}")
             ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(add-to-list 'org-latex-classes
          '("fa-cv"
             "\\documentclass[a4paper]{article}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{graphicx}
\\usepackage{grffile}
\\usepackage{longtable}
\\usepackage{wrapfig}
\\usepackage{rotating}
\\usepackage[normalem]{ulem}
\\usepackage{amsmath}
\\usepackage{textcomp}
\\usepackage{amssymb}
\\usepackage{capt-of}
\\usepackage{url}
\\usepackage{calc}
\\usepackage{parskip}            % ignore paragraph prefix space
\\usepackage{titlesec}           % custom section
\\usepackage{enumitem}           % custom lists
\\usepackage[big]{layaureo} % Margin formatting of the A4 page, an
                           % alternative to layaureo can be
                           % \\usepackage{fullpage}
                           % To reduce the height of the top margin
                           % uncomment: \\addtolength{\\voffset}{-1.3cm}
\\usepackage{color}
\\usepackage{hyperref}
\\definecolor{linkcolour}{rgb}{0,0.2,0.6}
\\hypersetup{colorlinks=false,breaklinks, urlcolor=linkcolour,linkcolor=linkcolour}

\\definecolor{sectionothercolor}{rgb}{1.00,0.65,0.20}
\\definecolor{sectioncolor}{rgb}{0.35,0.45,0.55}

\\pagestyle{empty} % Removes page numbering

%% Set all text's left skip
\\leftskip=0.17\\textwidth

%% Config list
\\usepackage{enumitem}

\\usepackage{cite}

\\makeatletter
\\renewcommand*{\\maketitle}{%
  {
     \\raggedleft{\\Huge \\@title}\\\\[.5in]
  }
}
\\renewcommand*{\\tableofcontents}{}
\\makeatother

%% Redefine Section Headings, etc.
\\titleformat{\\section} %command
            {\\Large\\scshape\\raggedright} %format
            {} %prefix number label
            {0em} %sep
            {} %before
            [\\titlerule] %after
\\titlespacing{\\section}{0pt}{10pt}{5pt}

\\titleformat{\\subsection} %command
            [leftmargin] %shape
            {\\normalsize\\raggedleft\\bf} %format
            {} %prefix number label
            {0pt} %sep
            {} %before
            [] %after
\\titlespacing{\\subsection}
            {0.3\\textwidth}% max width of the title(for wrap/leftmargin shape)
            {5pt}% vertical space before the title
            {15pt}% separation between title and text
\\renewcommand
             [NO-DEFAULT-PACKAGES]
             [PACKAGES]
             [EXTRA]"
             ("\\section{%s}" . "\\section*{%s}")
             ("\\subsection{%s}" . "\\subsection*{%s}")
             ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
             ("\\paragraph{%s}" . "\\paragraph*{%s}")
             ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  ;(add-to-list 'org-latex-classes
  ;          '("moderncv"
  ;            "\\documentclass{moderncv}"
  ;            ("\\section{%s}" . "\\section*{%s}")
  ;            ("\\subsection{%s}" . "\\subsection*{%s}")))
;(setq org-latex-pdf-process (quote ("latexmk -pdf %f")))
(setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))
)

(add-hook 'org-mode-hook 'fa-org-conf)
(add-hook 'org-mode-hook '+org-pretty-mode)

;(defun fa-org-get-setup ()
;  (expand-file-name (concat (file-name-as-directory "org_tpl") "orgsetup.org") doom-private-dir)
;  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (after! evil-org                               ;;
;;     (use-package ox-moderncv                   ;;
;;         :load-path "~/.doom.d/packages/org-cv" ;;
;;         ;;:init (require 'ox-altacv))          ;;
;;         :init (require 'ox-moderncv))          ;;
;;     )                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(after! org
  (map! :map org-mode-map
        :localleader
        :desc "View exported file" "v" #'org-view-output-file)

  (defun org-view-output-file (&optional org-file-path)
    "Visit buffer open on the first output file (if any) found, using `org-view-output-file-extensions'"
    (interactive)
    (let* ((org-file-path (or org-file-path (buffer-file-name) ""))
           (dir (file-name-directory org-file-path))
           (basename (file-name-base org-file-path))
           (output-file nil))
      (dolist (ext org-view-output-file-extensions)
        (unless output-file
          (when (file-exists-p
                 (concat dir basename "." ext))
            (setq output-file (concat dir basename "." ext)))))
      (if output-file
          (if (member (file-name-extension output-file) org-view-external-file-extensions)
              (browse-url-xdg-open output-file)
            (pop-to-buffer (or (find-buffer-visiting output-file)
                               (find-file-noselect output-file))))
        (message "No exported file found")))))

(defvar org-view-output-file-extensions '("pdf" "md" "rst" "txt" "tex" "html")
  "Search for output files with these extensions, in order, viewing the first that matches")
(defvar org-view-external-file-extensions '("html")
  "File formats that should be opened externally.")
(setq-default major-mode 'org-mode)



(custom-set-faces!
  '(doom-modeline-buffer-modified :foreground "orange"))


(defun doom-modeline-conditional-buffer-encoding ()
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))

(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)


(setq-default
 delete-by-moving-to-trash t                      ; Delete files to trash
 window-combination-resize t                      ; take new window space from all other windows (not just current)
 x-stretch-cursor t)                              ; Stretch cursor to the glyph width

(setq undo-limit 80000000                         ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                         ; Nobody likes to loose work, I certainly don't
      truncate-string-ellipsis "…")               ; Unicode ellispis are nicer than "...", and also save /precious/ space

(display-time-mode 1)                             ; Enable time in the mode-line
(unless (equal "Battery status not available"
               (battery))
  (display-battery-mode 1))                       ; On laptops it's nice to know how much power you have
(global-subword-mode 1)                           ; Iterate through CamelCase words



(setq display-line-numbers-type 'relative)

(setq calc-angle-mode 'rad  ;; radians are rad
      calc-algebraic-mode t ;; allows '2*x instead of 'x<RET>2*
      calc-symbolic-mode t) ;; keeps stuff like √2 irrational for as long as possible


(after! company
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 2)
  (setq company-show-numbers t)
  (add-hook 'evil-normal-state-entry-hook #'company-abort)) ;; make aborting less annoying.


(setq-default history-length 1000)
(setq-default prescient-history-length 1000)
(after! evil (setq evil-ex-substitute-global t))

(set-company-backend! 'julia-mode '(company-yasnippet company-dabbrev-code :separate))


(use-package! org-ref
  :after org
   :preface
  ;; This need to be set before the package is loaded, because org-ref will
  ;; automatically `require' an associated package during its loading.
  (setq org-ref-completion-library (cond ((featurep! :completion ivy)  #'org-ref-ivy-cite)
                                         ((featurep! :completion helm) #'org-ref-helm-bibtex)
                                         (t                            #'org-ref-reftex)))
  :config
  (require 'doi-utils)
(setq bibtex-autokey-year-length 4
	bibtex-autokey-name-year-separator "-"
	bibtex-autokey-year-title-separator "-"
	bibtex-autokey-titleword-separator "-"
	bibtex-autokey-titlewords 2
	bibtex-autokey-titlewords-stretch 1
	bibtex-autokey-titleword-length 5)
(require 'org-ref-bibtex)
(require 'org-ref-pdf)
  )

(after! org-ref
  (map! :map org-mode-map
        :localleader
        :desc "org-ref insert link" "[" #'org-ref-insert-link)
    (map! :map org-mode-map
        :localleader
        :desc "org-ref insert ref" "(" #'org-ref-insert-ref-link)
    (map! :map org-mode-map
        :localleader
        :desc "org-ref hydra" "k" #'org-ref-cite-hydra/body)
  )

(after! pdf-view
  (map! :map pdf-view-mode-map
        :localleader
        :desc "pdf-view reset crop" "r" #'pdf-view-reset-slice)
  (map! :map pdf-view-mode-map
        :localleader
        :desc "pdf-view crop using mouse" "c" #'pdf-view-set-slice-using-mouse)
  )


(after! bibtex
  (require 'biblio)
  (map! :map bibtex-mode-map
        :localleader
        :desc "Biblio lookup" "l" #'biblio-lookup)
  )
