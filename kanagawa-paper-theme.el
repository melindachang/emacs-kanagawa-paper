;;; kanagawa-paper-theme.el --- Kanagawa Paper for Emacs -*- lexical-binding: t; -*-

;; Copyright (C) 2025 Melinda Chang
;; Copyright (C) 2025 Melinda Chang <melindachang.hy@gmail.com>

;; Author: Melinda Chang <melindachang.hy@gmail.com>
;; URL: https://codeberg.org/melindachang/emacs-kanagawa-paper
;; Version: 1.0.0
;; Package-Requires: ((emacs "24.3"))
;; Created: 12 July 2025
;; Keywords: themes faces

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;; This is an Emacs port of Kanagawa Paper, a muted remix of
;;; Kanagawa. For more information, see the source repo at
;;; https://github.com/thesimonho/kanagawa-paper.nvim.

;;; Code:

(unless (>= emacs-major-version 24)
  (error "Requires Emacs 24 or later"))

;;; Customizations:

(defgroup kanagawa-paper-theme nil
  "kanagawa-paper-theme options."
  :group 'faces)

(defcustom kanagawa-paper-theme-comment-italic t
  "Enable italics for comments and also disable background."
  :type 'boolean
  :group 'kanagawa-paper-theme)

(defcustom kanagawa-paper-theme-keyword-italic t
  "Enable italics for keywords."
  :type 'boolean
  :group 'kanagawa-paper-theme)

(defcustom kanagawa-paper-theme-org-height nil
  "Use varying text heights for org headings."
  :type 'boolean
  :group 'kanagawa-paper-theme)

(defcustom kanagawa-paper-theme-org-bold t
  "Inherit text bold for org headings"
  :type 'boolean
  :group 'kanagawa-paper-theme)

(defcustom kanagawa-paper-theme-org-priority-bold t
  "Inherit text bold for priority items in agenda view"
  :type 'boolean
  :group 'kanagawa-paper-theme)

(defcustom kanagawa-paper-theme-org-highlight nil
  "Highlight org headings."
  :type 'boolean
  :group 'kanagawa-paper-theme)

(defcustom kanagawa-paper-theme-underline-parens t
  "If non-nil, underline matching parens when using `show-paren-mode' or similar."
  :type 'boolean
  :group 'kanagawa-paper-theme)

(defun true-color-p ()
  (or (display-graphic-p)
      (= (tty-display-color-cells) 16777216)))

(deftheme kanagawa-paper "A remixed Kanagawa with muted colors")

(defconst kanagawa-paper-ink-palette
  `((fuji-white      ,(if (true-color-p) "#DCD7BA" "#ffffff"))
    (old-white       ,(if (true-color-p) "#C8C093" "#ffffff"))
    (fuji-gray       ,(if (true-color-p) "#727169" "#717C7C"))
    
    (sumi-ink-n1     ,(if (true-color-p) "#0f0f15" "#000000"))
    (sumi-ink-0      ,(if (true-color-p) "#16161D" "#000000"))
    (sumi-ink-1      ,(if (true-color-p) "#181820" "#080808"))
    (sumi-ink-2      ,(if (true-color-p) "#1a1a22" "#121212"))
    (sumi-ink-3      ,(if (true-color-p) "#1f1f28" "#121212"))
    (sumi-ink-4      ,(if (true-color-p) "#2a2a37" "#303030"))
    (sumi-ink-5      ,(if (true-color-p) "#363646" "#303030"))
    (sumi-ink-6      ,(if (true-color-p) "#54546d" "#303030"))
    
    (wave-blue-1     ,(if (true-color-p) "#223249" "#4e4e4e"))
    (wave-blue-2     ,(if (true-color-p) "#2D4F67" "#585858"))
    
    (wave-aqua-1     ,(if (true-color-p) "#6A9589" "#6a9589"))
    (wave-aqua-2     ,(if (true-color-p) "#7AA89F" "#717C7C"))
    (winter-green    ,(if (true-color-p) "#2B3328" "#585858"))
    (winter-yellow   ,(if (true-color-p) "#49443C" "#585858"))
    (winter-red      ,(if (true-color-p) "#43242B" "#585858"))
    (winter-blue     ,(if (true-color-p) "#252535" "#585858"))
    (autumn-green    ,(if (true-color-p) "#76946A" "#585858"))
    (autumn-red      ,(if (true-color-p) "#C34043" "#585858"))
    (autumn-yellow   ,(if (true-color-p) "#DCA561" "#585858"))
    
    (samurai-red     ,(if (true-color-p) "#E82424" "#585858"))
    (ronin-yellow    ,(if (true-color-p) "#FF9E3B" "#585858"))
    (dragon-blue     ,(if (true-color-p) "#658594" "#658594"))
    
    (oni-violet      ,(if (true-color-p) "#957FB8" "#717C7C"))
    (oni-violet-2    ,(if (true-color-p) "#b8b4d0" "#717C7C"))
    (spring-violet-1 ,(if (true-color-p) "#938AA9" "#717C7C"))
    (spring-violet-2 ,(if (true-color-p) "#9CABCA" "#717C7C"))
    (spring-blue     ,(if (true-color-p) "#7FB4CA" "#717C7C"))
    (crystal-blue    ,(if (true-color-p) "#7E9CD8" "#717C7C"))
    (light-blue      ,(if (true-color-p) "#A3D4D5" "#717C7C"))
    
    (spring-green    ,(if (true-color-p) "#98BB6C" "#717C7C"))
    (boat-yellow-1   ,(if (true-color-p) "#938056" "#717C7C"))
    (boat-yellow-2   ,(if (true-color-p) "#C0A36E" "#717C7C"))
    (carp-yellow     ,(if (true-color-p) "#E6C384" "#717C7C"))
    
    (sakura-pink     ,(if (true-color-p) "#D27E99" "#717C7C"))
    (wave-red        ,(if (true-color-p) "#E46876" "#717C7C"))
    (peach-red       ,(if (true-color-p) "#FF5D62" "#717C7C"))
    (surimi-orange   ,(if (true-color-p) "#FFA066" "#717C7C"))
    (katana-gray     ,(if (true-color-p) "#717C7C" "#717C7C"))
    (comet           ,(if (true-color-p) "#54536D" "#4e4e4e"))
    
    (dragon-black-0  ,(if (true-color-p) "#0d0c0c" "#000000"))
    (dragon-black-1  ,(if (true-color-p) "#12120f" "#000000"))
    (dragon-black-2  ,(if (true-color-p) "#1d1c19" "#000000"))
    (dragon-black-3  ,(if (true-color-p) "#181616" "#000000"))
    (dragon-black-4  ,(if (true-color-p) "#282727" "#000000"))
    (dragon-black-5  ,(if (true-color-p) "#393836" "#000000"))
    (dragon-black-6  ,(if (true-color-p) "#625e5a" "#000000"))
    
    (dragon-white    ,(if (true-color-p) "#c5c9c5" "#ffffff"))
    (dragon-green    ,(if (true-color-p) "#699469" "#ffffff"))
    (dragon-green-2  ,(if (true-color-p) "#8a9a7b" "#ffffff"))
    (dragon-pink     ,(if (true-color-p) "#a292a3" "#ffffff"))
    (dragon-orange   ,(if (true-color-p) "#b6927b" "#ffffff"))
    (dragon-orange-2 ,(if (true-color-p) "#b98d7b" "#ffffff"))
    (dragon-gray     ,(if (true-color-p) "#a6a69c" "#ffffff"))
    (dragon-gray-2   ,(if (true-color-p) "#9e9b93" "#ffffff"))
    (dragon-gray-3   ,(if (true-color-p) "#7a8382" "#ffffff"))
    (dragon-blue-2   ,(if (true-color-p) "#859fac" "#ffffff"))
    (dragon-blue-3   ,(if (true-color-p) "#708e9e" "#ffffff"))
    (dragon-blue-4   ,(if (true-color-p) "#5d7a88" "#ffffff"))
    (dragon-blue-5   ,(if (true-color-p) "#435965" "#ffffff"))
    (dragon-violet   ,(if (true-color-p) "#8992a7" "#ffffff"))
    (dragon-red      ,(if (true-color-p) "#c4746e" "#ffffff"))
    (dragon-aqua     ,(if (true-color-p) "#8ea49e" "#ffffff"))
    (dragon-ash      ,(if (true-color-p)  "#737c73"  "#717C7C"))
    (dragon-teal     ,(if (true-color-p)  "#949fb5"  "#717C7C"))
    (dragon-yellow   ,(if (true-color-p)  "#c4b28a"  "#717C7C"))
    
    (lotus-ink-0     ,(if (true-color-p)  "#3d3d5e"  "#717C7C"))
    (lotus-ink-1     ,(if (true-color-p)  "#545464"  "#717C7C"))
    (lotus-ink-2     ,(if (true-color-p)  "#43436c"  "#717C7C"))
    (lotus-gray      ,(if (true-color-p)  "#dcd7ba"  "#717C7C"))
    (lotus-gray-2    ,(if (true-color-p)  "#716e61"  "#717C7C"))
    (lotus-gray-3    ,(if (true-color-p)  "#8a8980"  "#717C7C"))
    (lotus-white-0   ,(if (true-color-p)  "#d5cea3"  "#717C7C"))
    (lotus-white-1   ,(if (true-color-p)  "#dcd5ac"  "#717C7C"))
    (lotus-white-2   ,(if (true-color-p)  "#e5ddb0"  "#717C7C"))
    (lotus-white-3   ,(if (true-color-p)  "#f2ecbc"  "#717C7C"))
    (lotus-white-4   ,(if (true-color-p)  "#e7dba0"  "#717C7C"))
    (lotus-white-5   ,(if (true-color-p)  "#e4d794"  "#717C7C"))
    (lotus-violet-1  ,(if (true-color-p)  "#a09cac"  "#717C7C"))
    (lotus-violet-2  ,(if (true-color-p)  "#766b90"  "#717C7C"))
    (lotus-violet-3  ,(if (true-color-p)  "#c9cbd1"  "#717C7C"))
    (lotus-violet-4  ,(if (true-color-p)  "#624c83"  "#717C7C"))
    (lotus-blue-1    ,(if (true-color-p)  "#c7d7e0"  "#717C7C"))
    (lotus-blue-2    ,(if (true-color-p)  "#b5cbd2"  "#717C7C"))
    (lotus-blue-3    ,(if (true-color-p)  "#9fb5c9"  "#717C7C"))
    (lotus-blue-4    ,(if (true-color-p)  "#4d699b"  "#717C7C"))
    (lotus-blue-5    ,(if (true-color-p)  "#5d57a3"  "#717C7C"))
    (lotus-green     ,(if (true-color-p)  "#6f894e"  "#717C7C"))
    (lotus-green-2   ,(if (true-color-p)  "#6e915f"  "#717C7C"))
    (lotus-green-3   ,(if (true-color-p)  "#b7d0ae"  "#717C7C"))
    (lotus-pink      ,(if (true-color-p)  "#b35b79"  "#717C7C"))
    (lotus-orange    ,(if (true-color-p)  "#cc6d00"  "#717C7C"))
    (lotus-orange-2  ,(if (true-color-p)  "#e98a00"  "#717C7C"))
    (lotus-yellow    ,(if (true-color-p)  "#77713f"  "#717C7C"))
    (lotus-yellow-2  ,(if (true-color-p)  "#836f4a"  "#717C7C"))
    (lotus-yellow-3  ,(if (true-color-p)  "#de9800"  "#717C7C"))
    (lotus-yellow-4  ,(if (true-color-p)  "#f9d791"  "#717C7C"))
    (lotus-red       ,(if (true-color-p)  "#c84053"  "#717C7C"))
    (lotus-red-2     ,(if (true-color-p)  "#d7474b"  "#717C7C"))
    (lotus-red-3     ,(if (true-color-p)  "#e82424"  "#717C7C"))
    (lotus-red-4     ,(if (true-color-p)  "#d9a594"  "#717C7C"))
    (lotus-aqua      ,(if (true-color-p)  "#597b75"  "#717C7C"))
    (lotus-aqua-2    ,(if (true-color-p)  "#5e857a"  "#717C7C"))
    (lotus-teal-1    ,(if (true-color-p)  "#4e8ca2"  "#717C7C"))
    (lotus-teal-2    ,(if (true-color-p)  "#6693bf"  "#717C7C"))
    (lotus-teal-3    ,(if (true-color-p)  "#5a7785"  "#717C7C"))
    (lotus-cyan      ,(if (true-color-p)  "#d7e3d8"  "#717C7C"))

    (canvas-aqua     ,(if (true-color-p)  "#57786c"  "#717C7C"))
    (canvas-aqua-2   ,(if (true-color-p)  "#5f847c"  "#717C7C"))
    (canvas-blue-1   ,(if (true-color-p)  "#93b5d0"  "#717C7C"))
    (canvas-blue-2   ,(if (true-color-p)  "#719ac2"  "#717C7C"))
    (canvas-blue-3   ,(if (true-color-p)  "#5c71a4"  "#717C7C"))
    (canvas-blue-4   ,(if (true-color-p)  "#526994"  "#717C7C"))
    (canvas-blue-5   ,(if (true-color-p)  "#515797"  "#717C7C"))
    (canvas-cyan     ,(if (true-color-p)  "#56a06a"  "#717C7C"))
    (canvas-gray-0   ,(if (true-color-p)  "#5d5c54"  "#717C7C"))
    (canvas-gray-1   ,(if (true-color-p)  "#858479"  "#717C7C"))
    (canvas-gray-2   ,(if (true-color-p)  "#a9a8a0"  "#717C7C"))
    (canvas-gray-3   ,(if (true-color-p)  "#b5b5ae"  "#717C7C"))
    (canvas-gray-4   ,(if (true-color-p)  "#c1c1bb"  "#717C7C"))
    (canvas-green    ,(if (true-color-p)  "#73865b"  "#717C7C"))
    (canvas-green-2  ,(if (true-color-p)  "#718e64"  "#717C7C"))
    (canvas-green-3  ,(if (true-color-p)  "#a0c991"  "#717C7C"))
    (canvas-ink-0    ,(if (true-color-p)  "#4c4c65"  "#717C7C"))
    (canvas-ink-1    ,(if (true-color-p)  "#595b62"  "#717C7C"))
    (canvas-ink-2    ,(if (true-color-p)  "#484862"  "#717C7C"))
    (canvas-orange   ,(if (true-color-p)  "#b8805e"  "#717C7C"))
    (canvas-orange-2 ,(if (true-color-p)  "#d59260"  "#717C7C"))
    (canvas-pink     ,(if (true-color-p)  "#ac7085"  "#717C7C"))
    (canvas-red      ,(if (true-color-p)  "#b35560"  "#717C7C"))
    (canvas-red-2    ,(if (true-color-p)  "#c75758"  "#717C7C"))
    (canvas-red-3    ,(if (true-color-p)  "#c95d5d"  "#717C7C"))
    (canvas-red-4    ,(if (true-color-p)  "#d99a85"  "#717C7C"))
    (canvas-teal-1   ,(if (true-color-p)  "#5f8a9b"  "#717C7C"))
    (canvas-teal-2   ,(if (true-color-p)  "#618bb6"  "#717C7C"))
    (canvas-teal-3   ,(if (true-color-p)  "#526c79"  "#717C7C"))
    (canvas-violet-1 ,(if (true-color-p)  "#c4cbdc"  "#717C7C"))
    (canvas-violet-2 ,(if (true-color-p)  "#a398bf"  "#717C7C"))
    (canvas-violet-3 ,(if (true-color-p)  "#7967a2"  "#717C7C"))
    (canvas-violet-4 ,(if (true-color-p)  "#6f4f9d"  "#717C7C"))
    (canvas-white-0  ,(if (true-color-p)  "#cbc8bc"  "#717C7C"))
    (canvas-white-1  ,(if (true-color-p)  "#d3d0c3"  "#717C7C"))
    (canvas-white-2  ,(if (true-color-p)  "#d8d8d2"  "#717C7C"))
    (canvas-white-3  ,(if (true-color-p)  "#e1e1de"  "#717C7C"))
    (canvas-white-4  ,(if (true-color-p)  "#e6e6e3"  "#717C7C"))
    (canvas-white-5  ,(if (true-color-p)  "#ecece8"  "#717C7C"))
    (canvas-yellow   ,(if (true-color-p)  "#a67337"  "#717C7C"))
    (canvas-yellow-2 ,(if (true-color-p)  "#c08a48"  "#717C7C"))
    (canvas-yellow-3 ,(if (true-color-p)  "#d3a56b"  "#717C7C"))
    (canvas-yellow-4 ,(if (true-color-p)  "#e0be6d"  "#717C7C"))
    ))

(defmacro define-kanagawa-paper-ink-theme (theme &rest faces)
  `(let ((class '((class color) (min-colors 89)))
         ,@kanagawa-paper-ink-palette)
     (custom-theme-set-faces
      ,theme
      ,@faces)))

(define-kanagawa-paper-ink-theme
 'kanagawa-paper
 `(default                                       ((,class (:background ,sumi-ink-3 :foreground ,fuji-white))))
 `(border                                        ((,class (:background ,sumi-ink-3 :foreground ,dragon-black-6))))
 `(button                                        ((,class (:foreground ,dragon-aqua))))
 `(child-frame                                   ((,class (:background ,sumi-ink-0 :foreground ,sumi-ink-0))))
 `(child-frame-border                            ((,class (:background ,sumi-ink-0 :foreground ,sumi-ink-0))))
 `(cursor                                        ((,class (:background ,dragon-yellow :foreground ,dragon-black-2 :weight bold))))
 `(error                                         ((,class (:foreground ,dragon-red))))
 `(fringe                                        ((,class (:foreground ,sumi-ink-3))))
 `(glyph-face                                    ((,class (:background ,sumi-ink-4))))
 `(glyphless-char                                ((,class (:foreground ,sumi-ink-4))))
 `(header-line                                   ((,class (:background ,sumi-ink-0))))
 `(highlight                                     ((,class (:background ,sumi-ink-5))))
 `(hl-line                                       ((,class (:background ,sumi-ink-4))))
 `(homoglyph                                     ((,class (:foreground ,dragon-aqua))))
 `(internal-border                               ((,class (:background ,sumi-ink-3))))
 `(line-number                                   ((,class (:foreground ,sumi-ink-6))))
 `(line-number-current-line                      ((,class (:foreground ,dragon-yellow :background ,sumi-ink-3 :weight bold))))
 `(lv-separator                                  ((,class (:foreground ,dragon-blue-2 :background ,sumi-ink-3))))
 `(match                                         ((,class (:background ,dragon-yellow :foreground ,dragon-black-2))))
 `(menu                                          ((,class (:background ,sumi-ink-0 :foreground ,fuji-white))))

 `(mode-line                                     ((,class (:background ,sumi-ink-4 :foreground ,dragon-gray-2 :weight bold))))
 `(mode-line-inactive                            ((,class (:background ,sumi-ink-n1 :foreground ,sumi-ink-6
								                                                       :box (:line-width 1 :color ,sumi-ink-2)))))
 `(mode-line-active                              ((,class (:background ,sumi-ink-4 :foreground ,dragon-gray-2
								                                                       :box (:line-width 1 :color ,sumi-ink-3)))))
 `(mode-line-highlight                           ((,class (:foreground ,dragon-yellow))))
 `(mode-line-buffer-id                           ((,class (:foreground ,dragon-aqua :weight bold))))

 `(numbers                                       ((,class (:background ,dragon-pink))))
 `(region                                        ((,class (:background ,sumi-ink-5))))
 `(separator-line                                ((,class (:background ,dragon-violet))))
 `(fill-column-indicator                         ((,class (:background ,sumi-ink-4 :foreground ,dragon-gray-2))))
 `(shadow                                        ((,class (:foreground ,fuji-gray))))
 `(success                                       ((,class (:foreground ,dragon-green))))
 `(vertical-border                               ((,class (:foreground ,dragon-violet))))
 `(warning                                       ((,class (:foreground ,dragon-yellow))))
 `(window-border                                 ((,class (:background ,dragon-violet))))
 `(window-divider                                ((,class (:foreground ,dragon-violet))))
 `(hi-yellow                                     ((,class (:background ,dragon-yellow :foreground ,dragon-black-2))))

 ;; Font lock
 `(font-lock-type-face                           ((,class (:foreground ,dragon-aqua))))
 `(font-lock-regexp-grouping-backslash           ((,class (:foreground ,dragon-red))))
 `(font-lock-keyword-face                        ((,class (:foreground ,dragon-pink :slant ,(if kanagawa-paper-theme-keyword-italic 'italic 'normal)))))
 `(font-lock-warning-face                        ((,class (:foreground ,dragon-yellow))))
 `(font-lock-string-face                         ((,class (:foreground ,dragon-green-2 :slant italic))))
 `(font-lock-builtin-face                        ((,class (:foreground ,dragon-violet))))
 `(font-lock-reference-face                      ((,class (:foreground ,dragon-yellow))))
 `(font-lock-constant-face                       ((,class (:foreground ,dragon-orange))))
 `(font-lock-function-name-face                  ((,class (:foreground ,dragon-blue-2))))
 `(font-lock-variable-name-face                  ((,class (:inherit default))))
 `(font-lock-negation-char-face                  ((,class (:foreground ,dragon-red))))
 `(font-lock-comment-face                        ((,class (:foreground ,fuji-gray :slant ,(if kanagawa-paper-theme-keyword-italic 'italic 'normal)))))
 `(font-lock-comment-delimiter-face              ((,class (:foreground ,fuji-gray :slant ,(if kanagawa-paper-theme-keyword-italic 'italic 'normal)))))
 `(font-lock-doc-face                            ((,class (:inherit font-lock-comment-face))))
 `(font-lock-doc-markup-face                     ((,class (:inherit font-lock-comment-face))))
 `(font-lock-preprocessor-face                   ((,class (:foreground ,dragon-red))))

 `(elisp-shorthand-font-lock-face                ((,class (:foreground ,fuji-white))))
 `(info-xref                                     ((,class (:foreground ,dragon-yellow))))
 ;; `(minibuffer-prompt-end                         ((,class (:foreground ,autumn-red :background ,dragon-blue))))
 `(minibuffer-prompt                             ((,class (:foreground ,dragon-yellow :background ,dragon-black-2))))
 `(epa-mark                                      ((,class (:foreground ,dragon-red))))
 `(dired-mark                                    ((,class (:foreground ,dragon-red))))
 `(trailing-whitespace                           ((,class (:background ,sumi-ink-6))))

 ;; Battery colors
 `(doom-modeline-battery-critical                ((,class (:foreground ,dragon-red))))
 `(doom-modeline-battery-warning                 ((,class (:foreground ,dragon-yellow))))
 `(doom-modeline-battery-charging                ((,class (:foreground ,fuji-gray))))
 `(doom-modeline-battery-error                   ((,class (:foreground ,dragon-red))))
 `(doom-modeline-battery-normal                  ((,class (:foreground ,dragon-violet))))
 `(doom-modeline-battery-full                    ((,class (:foreground ,dragon-aqua))))

 ;; Doom visual state
 `(doom-modeline-evil-motion-state               ((,class (:foreground ,dragon-blue))))
 `(doom-modeline-evil-emacs-state                ((,class (:foreground ,dragon-blue-2))))
 `(doom-modeline-evil-insert-state               ((,class (:foreground ,dragon-red))))
 `(doom-modeline-evil-normal-state               ((,class (:foreground ,dragon-yellow))))
 `(doom-modeline-evil-visual-state               ((,class (:foreground ,spring-violet-1))))
 `(doom-modeline-evil-replace-state              ((,class (:foreground ,dragon-red))))
 `(doom-modeline-evil-operator-state             ((,class (:foreground ,dragon-yellow))))


 `(doom-modeline-project-dir                     ((,class (:weight bold :foreground ,dragon-aqua))))
 `(doom-modeline-buffer-path                     ((,class (:inherit bold :foreground ,dragon-aqua))))
 `(doom-modeline-buffer-file                     ((,class (:inherit bold :foreground ,dragon-violet))))
 `(doom-modeline-buffer-modified                 ((,class (:inherit bold :foreground ,dragon-yellow))))
 `(doom-modeline-error                           ((,class (:background ,dragon-red))))
 `(doom-modeline-buffer-major-mode               ((,class (:foreground ,dragon-aqua :weight bold))))
 `(doom-modeline-info                            ((,class (:weight bold :foreground ,dragon-blue))))
 `(doom-modeline-project-dir                     ((,class (:weight bold :foreground ,dragon-orange))))
 `(doom-modeline-bar                             ((,class (:weight bold :background ,spring-violet-1))))
 `(doom-modeline-panel                           ((,class (:inherit bold :background ,dragon-yellow :foreground ,dragon-black-2))))
 `(doom-themes-visual-bell                       ((,class (:background ,dragon-red))))

 ;; elfeed
 `(elfeed-search-feed-face                       ((,class (:foreground ,dragon-yellow))))
 `(elfeed-search-tag-face                        ((,class (:foreground ,dragon-aqua))))

 ;; message colors
 `(message-header-name                           ((,class (:foreground ,dragon-pink))))
 `(message-header-other                          ((,class (:foreground ,dragon-violet))))
 `(message-header-subject                        ((,class (:foreground ,dragon-aqua))))
 `(message-header-to                             ((,class (:foreground ,dragon-orange))))
 `(message-header-cc                             ((,class (:foreground ,dragon-orange))))
 `(message-header-xheader                        ((,class (:foreground ,fuji-gray))))
 `(custom-link                                   ((,class (:foreground ,dragon-blue))))
 `(link                                          ((,class (:foreground ,dragon-blue))))

 ;; markdown
 `(markdown-header-face-1                       ((,class (:inherit bold :foreground ,dragon-red))))
 `(markdown-header-face-2                       ((,class (:inherit bold :foreground ,dragon-violet))))
 `(markdown-header-face-3                       ((,class (:foreground ,dragon-blue))))
 `(markdown-header-face-4                       ((,class (:foreground ,dragon-orange))))
 `(markdown-header-face-5                       ((,class (:foreground ,dragon-green))))
 `(markdown-header-face-6                       ((,class (:foreground ,fuji-gray))))

 ;; org-mode
 `(org-done                                      ((,class (:foreground ,dragon-blue))))
 `(org-code                                      ((,class (:background ,sumi-ink-1))))
 `(org-meta-line                                 ((,class (:foreground ,fuji-gray))))
 `(org-block                                     ((,class (:foreground ,fuji-gray))))
 `(org-block-begin-line                          ((,class (:foreground ,fuji-gray))))
 `(org-block-end-line                            ((,class (:foreground ,fuji-gray))))

 `(org-todo                                      ((,class (:foreground ,dragon-orange :weight bold))))
 `(org-headline-todo                             ((,class (:foreground ,dragon-orange))))
 `(org-headline-done                             ((,class (:foreground ,fuji-gray :strike-through t))))
 `(org-upcoming-deadline                         ((,class (:foreground ,dragon-red))))
 `(org-footnote                                  ((,class (:foreground ,wave-aqua-2))))
 `(org-indent                                    ((,class (:background ,sumi-ink-3 :foreground ,sumi-ink-3))))
 `(org-hide                                      ((,class (:background ,sumi-ink-3 :foreground ,sumi-ink-3))))
 `(org-date                                      ((,class (:foreground ,fuji-gray))))
 `(org-ellipsis                                  ((,class (:foreground ,dragon-aqua :weight bold))))

 `(org-level-1                                   ((,class (:inherit bold :foreground ,dragon-red :height ,(if kanagawa-paper-theme-org-height 1.4 1.0) :weight ,(if kanagawa-paper-theme-org-bold 'unspecified 'normal)))))
 `(org-level-2                                   ((,class (:inherit bold :foreground ,dragon-violet :height ,(if kanagawa-paper-theme-org-height 1.3 1.0) :weight ,(if kanagawa-paper-theme-org-bold 'unspecified 'normal)))))
 `(org-level-3                                   ((,class (:foreground ,dragon-blue :height ,(if kanagawa-paper-theme-org-height 1.2 1.0)))))
 `(org-level-4                                   ((,class (:foreground ,dragon-orange :height ,(if kanagawa-paper-theme-org-height 1.1 1.0)))))
 `(org-level-5                                   ((,class (:foreground ,dragon-yellow :height ,(if kanagawa-paper-theme-org-height 1.1 1.0)))))
 `(org-level-6                                   ((,class (:foreground ,dragon-green :height ,(if kanagawa-paper-theme-org-height 1.1 1.0)))))
 `(org-level-7                                   ((,class (:foreground ,dragon-red :height ,(if kanagawa-paper-theme-org-height 1.1 1.0)))))
 `(org-level-8                                   ((,class (:foreground ,fuji-gray :height ,(if kanagawa-paper-theme-org-height 1.1 1.0)))))
 `(org-priority                                  ((,class (:foreground ,dragon-yellow :inherit bold :weight ,(if kanagawa-paper-theme-org-priority-bold 'unspecified 'normal)))))

 ;; imenu
 `(imenu-list-entry-face                         ((,class (:foreground ,fuji-white))))
 `(imenu-list-entry-face-0                       ((,class (:foreground ,peach-red))))
 `(imenu-list-entry-face-1                       ((,class (:foreground ,spring-violet-2))))
 `(imenu-list-entry-face-2                       ((,class (:foreground ,boat-yellow-1))))
 `(imenu-list-entry-face-3                       ((,class (:foreground ,fuji-white))))
 `(imenu-list-entry-subalist-face-0              ((,class (:foreground ,peach-red))))
 `(imenu-list-entry-subalist-face-1              ((,class (:foreground ,spring-violet-2))))
 `(imenu-list-entry-subalist-face-2              ((,class (:foreground ,boat-yellow-1))))
 `(imenu-list-entry-subalist-face-3              ((,class (:foreground ,fuji-white))))

 ;; which-key
 `(which-key-key-face                            ((,class (:inherit font-lock-variable-name-face))))
 `(which-func                                    ((,class (:inherit font-lock-function-name-face :weight bold))))
 `(which-key-group-description-face              ((,class (:foreground ,wave-red))))
 `(which-key-command-description-face            ((,class (:foreground ,crystal-blue))))
 `(which-key-local-map-description-face          ((,class (:foreground ,carp-yellow))))
 `(which-key-posframe                            ((,class (:background ,wave-blue-1))))
 `(which-key-posframe-border                     ((,class (:background ,wave-blue-1))))

 ;; swiper
 `(swiper-line-face                              ((,class (:foreground ,carp-yellow))))
 `(swiper-background-match-face-1                ((,class (:background ,surimi-orange :foreground ,sumi-ink-0))))
 `(swiper-background-match-face-2                ((,class (:background ,crystal-blue :foreground ,sumi-ink-0))))
 `(swiper-background-match-face-3                ((,class (:background ,boat-yellow-1 :foreground ,sumi-ink-0))))
 `(swiper-background-match-face-4                ((,class (:background ,peach-red :foreground ,sumi-ink-0))))
 `(swiper-match-face-1                           ((,class (:inherit swiper-background-match-face-1))))
 `(swiper-match-face-2                           ((,class (:inherit swiper-background-match-face-2))))
 `(swiper-match-face-3                           ((,class (:inherit swiper-background-match-face-3))))
 `(swiper-match-face-4                           ((,class (:inherit swiper-background-match-face-4))))

 `(counsel-outline-default                       ((,class (:foreground ,carp-yellow))))
 `(info-header-xref                              ((,class (:foreground ,carp-yellow))))
 `(xref-file-header                              ((,class (:foreground ,carp-yellow))))
 `(xref-match                                    ((,class (:foreground ,carp-yellow))))

 ;; rainbow delimiters
 `(rainbow-delimiters-mismatched-face            ((,class (:foreground ,peach-red))))
 `(rainbow-delimiters-unmatched-face             ((,class (:foreground ,wave-aqua-2))))
 `(rainbow-delimiters-base-error-face            ((,class (:foreground ,peach-red))))
 `(rainbow-delimiters-base-face                  ((,class (:foreground ,sumi-ink-4))))

 `(rainbow-delimiters-depth-1-face               ((,class (:foreground ,spring-violet-2))))
 `(rainbow-delimiters-depth-2-face               ((,class (:foreground ,dragon-blue))))
 `(rainbow-delimiters-depth-3-face               ((,class (:foreground ,spring-violet-1))))
 `(rainbow-delimiters-depth-4-face               ((,class (:foreground ,spring-green))))
 `(rainbow-delimiters-depth-5-face               ((,class (:foreground ,wave-aqua-2))))
 `(rainbow-delimiters-depth-6-face               ((,class (:foreground ,carp-yellow))))
 `(rainbow-delimiters-depth-7-face               ((,class (:foreground ,wave-red))))
 `(rainbow-delimiters-depth-8-face               ((,class (:foreground ,light-blue))))
 `(rainbow-delimiters-depth-9-face               ((,class (:foreground ,spring-violet-2))))

 ;; show-paren
 `(show-paren-match                              ((,class (:background ,wave-aqua-1 :foreground ,sumi-ink-0 :weight bold :underline ,(when kanagawa-paper-theme-underline-parens t)))))
 `(show-paren-match-expression                   ((,class (:background ,wave-aqua-1 :foreground ,sumi-ink-0 :weight bold))))
 `(show-paren-mismatch                           ((,class (:background ,peach-red :foreground ,old-white :underline ,(when kanagawa-paper-theme-underline-parens t)))))
 `(tooltip                                       ((,class (:foreground ,light-blue :background ,sumi-ink-0 :weight bold))))

 ;; company-box
 `(company-tooltip                               ((,class (:background ,sumi-ink-2))))
 `(company-tooltip-common                        ((,class (:foreground ,autumn-yellow))))
 `(company-tooltip-quick-access                  ((,class (:foreground ,spring-violet-2))))
 `(company-tooltip-scrollbar-thumb               ((,class (:background ,autumn-red))))
 `(company-tooltip-scrollbar-track               ((,class (:background ,sumi-ink-2))))
 `(company-tooltip-search                        ((,class (:background ,carp-yellow :foreground ,sumi-ink-0 :distant-foreground ,fuji-white))))
 `(company-tooltip-selection                     ((,class (:background ,peach-red :foreground ,winter-red :weight bold))))
 `(company-tooltip-mouse                         ((,class (:background ,sumi-ink-2 :foreground ,sumi-ink-0 :distant-foreground ,fuji-white))))
 `(company-tooltip-annotation                    ((,class (:foreground ,peach-red :distant-foreground ,sumi-ink-1))))
 `(company-scrollbar-bg                          ((,class (:inherit tooltip))))
 `(company-scrollbar-fg                          ((,class (:background ,peach-red))))
 `(company-preview                               ((,class (:foreground ,carp-yellow))))
 `(company-preview-common                        ((,class (:foreground ,peach-red :weight bold))))
 `(company-preview-search                        ((,class (:inherit company-tooltip-search))))
 `(company-template-field                        ((,class (:inherit match))))

 ;; flycheck
 `(flycheck-posframe-background-face             ((,class (:background ,sumi-ink-0))))
 `(flycheck-posframe-face                        ((,class (:background ,sumi-ink-0))))
 `(flycheck-posframe-info-face                   ((,class (:background ,sumi-ink-0 :foreground ,autumn-green))))
 `(flycheck-posframe-warning-face                ((,class (:background ,sumi-ink-0 :foreground ,light-blue))))
 `(flycheck-posframe-error-face                  ((,class (:background ,sumi-ink-0 :foreground ,samurai-red))))
 `(flycheck-fringe-warning                       ((,class (:foreground ,light-blue))))
 `(flycheck-fringe-error                         ((,class (:foreground ,samurai-red))))
 `(flycheck-fringe-info                          ((,class (:foreground ,autumn-green))))
 `(flycheck-error-list-warning                   ((,class (:foreground ,ronin-yellow :weight bold))))
 `(flycheck-error-list-error                     ((,class (:foreground ,samurai-red :weight bold))))
 `(flycheck-error-list-info                      ((,class (:foreground ,wave-aqua-1 :weight bold))))
 `(flycheck-inline-error                         ((,class (:foreground ,samurai-red :background ,winter-red :slant italic :weight bold :height 138))))
 `(flycheck-inline-info                          ((,class (:foreground ,light-blue :background ,winter-blue :slant italic  :weight bold :height 138))))
 `(flycheck-inline-warning                       ((,class (:foreground ,winter-yellow :background ,carp-yellow :slant italic :weight bold :height 138))))

 ;; indent dots
 `(highlight-indent-guides-character-face        ((,class (:foreground ,sumi-ink-3))))
 `(highlight-indent-guides-stack-character-face  ((,class (:foreground ,sumi-ink-3))))
 `(highlight-indent-guides-stack-odd-face        ((,class (:foreground ,sumi-ink-3))))
 `(highlight-indent-guides-stack-even-face       ((,class (:foreground ,comet))))
 `(highlight-indent-guides-stack-character-face  ((,class (:foreground ,sumi-ink-3))))
 `(highlight-indent-guides-even-face             ((,class (:foreground ,sumi-ink-2))))
 `(highlight-indent-guides-odd-face              ((,class (:foreground ,comet))))


 `(highlight-operators-face                      ((,class (:foreground ,boat-yellow-2))))
 `(highlight-quoted-symbol                       ((,class (:foreground ,spring-green))))
 `(highlight-numbers-face                        ((,class (:foreground ,sakura-pink))))
 `(highlight-symbol-face                         ((,class (:background ,wave-blue-1 :foreground ,light-blue))))

 ;; ivy
 `(ivy-current-match                             ((,class (:background ,crystal-blue :foreground ,sumi-ink-0 :weight bold))))
 `(ivy-action                                    ((,class (:background unspecified :foreground ,fuji-white))))
 `(ivy-grep-line-number                          ((,class (:background unspecified :foreground ,spring-green))))
 `(ivy-minibuffer-match-face-1                   ((,class (:background unspecified :foreground ,wave-red))))
 `(ivy-minibuffer-match-face-2                   ((,class (:background unspecified :foreground ,spring-green))))
 `(ivy-minibuffer-match-highlight                ((,class (:foreground ,light-blue))))
 `(ivy-grep-info                                 ((,class (:foreground ,light-blue))))
 `(ivy-grep-line-number                          ((,class (:foreground ,spring-violet-2))))
 `(ivy-confirm-face                              ((,class (:foreground ,wave-aqua-2))))

 ;; posframe's
 `(ivy-posframe                                  ((,class (:background ,sumi-ink-2))))
 `(ivy-posframe-border                           ((,class (:background ,sumi-ink-3))))

 ;;treemacs
 `(treemacs-directory-collapsed-face             ((,class (:foreground ,fuji-white))))
 `(treemacs-directory-face                       ((,class (:foreground ,fuji-white))))

 `(treemacs-file-face                            ((,class (:foreground ,fuji-white))))

 `(treemacs-git-added-face                       ((,class (:foreground ,surimi-orange))))
 `(treemacs-git-renamed-face                     ((,class (:foreground ,fuji-white))))
 `(treemacs-git-ignored-face                     ((,class (:foreground ,sumi-ink-4))))
 `(treemacs-git-unmodified-face                  ((,class (:foreground ,fuji-white))))
 `(treemacs-git-renamed-face                     ((,class (:foreground ,fuji-white))))
 `(treemacs-git-modified-face                    ((,class (:foreground ,spring-green))))

 ;;lsp
 `(lsp-ui-doc-background                         ((,class (:background ,sumi-ink-0 :foreground ,peach-red))))
 `(lsp-ui-doc-header                             ((,class (:background ,sumi-ink-0 :foreground ,peach-red))))
 `(lsp-ui-doc-border                             ((,class (:background unspecified :foreground unspecified))))
 `(lsp-ui-peek-filename                          ((,class (:foreground ,light-blue))))
 `(lsp-ui-sideline-code-action                   ((,class (:foreground ,carp-yellow))))
 `(lsp-ui-sideline-current-symbol                ((,class (:foreground ,spring-blue))))
 `(lsp-ui-sideline-symbol                        ((,class (:foreground ,dragon-blue))))

 `(lsp-headerline-breadcrumb-path-error-face     ((,class (:underline (:color ,spring-green :style wave) :foreground ,sumi-ink-4 :background ,sumi-ink-0))))
 `(lsp-headerline-breadcrumb-path-face           ((,class (:background ,sumi-ink-0))))
 `(lsp-headerline-breadcrumb-path-hint-face      ((,class (:background ,sumi-ink-0))))
 `(lsp-headerline-breadcrumb-path-info-face      ((,class (:background ,sumi-ink-0))))
 `(lsp-headerline-breadcrumb-separator-face      ((,class (:background ,sumi-ink-0))))
 `(lsp-headerline-breadcrumb-symbols-face        ((,class (:background ,sumi-ink-0))))
 `(lsp-headerline-breadcrumb-project-prefix-face ((,class (:background ,sumi-ink-0))))
 `(lsp-headerline-breadcrumb-symbols-error-face  ((,class (:foreground ,peach-red))))

 ;; Eglot
 `(eglot-diagnostic-tag-unnecessary-face         ((,class (:background ,sumi-ink-0 :foreground ,fuji-gray))))


 ;; dashboard
 `(dashboard-heading                             ((,class (:foreground ,spring-violet-2 :weight bold))))
 `(dashboard-items-face                          ((,class (:bold unspecified :foreground ,fuji-white))))
 `(dashboard-banner-logo-title                   ((,class (:weight bold :height 200))))
 `(dashboard-no-items-face                       ((,class (:foreground ,sumi-ink-4))))

 ;; all-the-icons
 `(all-the-icons-dgreen                          ((,class (:foreground ,wave-aqua-2))))
 `(all-the-icons-green                           ((,class (:foreground ,wave-aqua-2))))
 `(all-the-icons-dpurple                         ((,class (:foreground ,spring-violet-2))))
 `(all-the-icons-purple                          ((,class (:foreground ,spring-violet-2))))

 ;; evil
 `(evil-ex-lazy-highlight                        ((,class (:foreground ,winter-green :background ,autumn-green :weight bold))))
 `(evil-ex-substitute-matches                    ((,class (:foreground ,winter-red :background ,autumn-red :weight bold))))
 `(evil-ex-substitute-replacement                ((,class (:foreground ,surimi-orange :strike-through unspecified :inherit evil-ex-substitute-matches))))
 `(evil-search-highlight-persist-highlight-face  ((,class (:background ,carp-yellow))))

 ;; term
 `(term                                          ((,class (:background ,sumi-ink-0 :foreground ,fuji-white))))
 `(term-color-blue                               ((,class (:background ,crystal-blue :foreground ,crystal-blue))))
 `(term-color-bright-blue                        ((,class (:inherit term-color-blue))))
 `(term-color-green                              ((,class (:background ,wave-aqua-2 :foreground ,wave-aqua-2))))
 `(term-color-bright-green                       ((,class (:inherit term-color-green))))
 `(term-color-black                              ((,class (:background ,sumi-ink-0 :foreground ,fuji-white))))
 ;; NOTE - has effect on vterm as well so vterm specific settings bellow doesn't do much.
 `(term-color-bright-black                       ((,class (:background ,sumi-ink-3 :foreground ,fuji-gray))))
 `(term-color-white                              ((,class (:background ,fuji-white :foreground ,fuji-white))))
 `(term-color-bright-white                       ((,class (:background ,old-white :foreground ,old-white))))
 `(term-color-red                                ((,class (:background ,peach-red :foreground ,peach-red))))
 `(term-color-bright-red                         ((,class (:background ,spring-green :foreground ,spring-green))))
 `(term-color-yellow                             ((,class (:background ,carp-yellow :foreground ,carp-yellow))))
 `(term-color-bright-yellow                      ((,class (:background ,carp-yellow :foreground ,carp-yellow))))
 `(term-color-cyan                               ((,class (:background ,spring-blue :foreground ,spring-blue))))
 `(term-color-bright-cyan                        ((,class (:background ,spring-blue :foreground ,spring-blue))))
 `(term-color-magenta                            ((,class (:background ,spring-violet-2 :foreground ,spring-violet-2))))
 `(term-color-bright-magenta                     ((,class (:background ,spring-violet-2 :foreground ,spring-violet-2))))
 ;; vterm
 `(vterm-color-black                             ((,class (:background ,sumi-ink-0 :foreground ,spring-violet-2))))
 `(vterm-color-underline                         ((,class (:foreground ,fuji-white))))
 `(vterm-color-inverse-video                     ((,class (:background ,sumi-ink-0 :inverse-video t))))

 ;; popup
 `(popup-face                                    ((,class (:inherit tooltip))))
 `(popup-selection-face                          ((,class (:inherit tooltip))))
 `(popup-tip-face                                ((,class (:inherit tooltip))))

 ;; anzu
 `(anzu-match-1                                  ((,class (:foreground ,wave-aqua-2 :background ,sumi-ink-2))))
 `(anzu-match-2                                  ((,class (:foreground ,carp-yellow :background ,sumi-ink-2))))
 `(anzu-match-3                                  ((,class (:foreground ,light-blue :background ,sumi-ink-2))))

 `(anzu-mode-line                                ((,class (:foreground ,sumi-ink-0 :background ,spring-violet-2))))
 `(anzu-mode-no-match                            ((,class (:foreground ,fuji-white :background ,peach-red))))
 `(anzu-replace-to                               ((,class (:foreground ,spring-blue :background ,winter-blue))))
 `(anzu-replace-highlight                        ((,class (:foreground ,peach-red :background ,winter-red :strike-through t))))

 ;; ace
 `(ace-jump-face-background                      ((,class (:foreground ,wave-blue-2))))
 `(ace-jump-face-foreground                      ((,class (:foreground ,peach-red :background ,sumi-ink-0 :weight bold))))

 ;; vertico
 `(vertico-multiline                             ((,class (:background ,samurai-red))))
 `(vertico-group-title                           ((,class (:background ,winter-blue :foreground ,light-blue :weight bold))))
 `(vertico-group-separator                       ((,class (:background ,winter-blue :foreground ,light-blue :strike-through t))))
 `(vertico-current                               ((,class (:foreground ,carp-yellow :weight bold :slant italic :background ,wave-blue-1))))

 `(vertico-posframe-border                       ((,class (:background ,sumi-ink-3))))
 `(vertico-posframe                              ((,class (:background ,sumi-ink-2))))
 `(orderless-match-face-0                        ((,class (:foreground ,crystal-blue :weight bold))))

 `(comint-highlight-prompt                       ((,class (:background ,spring-violet-2 :foreground ,sumi-ink-1))))
 `(completions-annotations                       ((,class (:background unspecified :foreground ,dragon-blue :slant italic))))
 `(marginalia-file-priv-no                       ((,class (:background unspecified))))

 ;; hydra
 `(hydra-face-amaranth                           ((,class (:foreground ,autumn-red))))
 `(hydra-face-blue                               ((,class (:foreground ,spring-blue))))
 `(hydra-face-pink                               ((,class (:foreground ,sakura-pink))))
 `(hydra-face-red                                ((,class (:foreground ,peach-red))))
 `(hydra-face-teal                               ((,class (:foreground ,light-blue))))

 ;; tab-bar
 `(tab-bar                                       ((,class (:background ,sumi-ink-0))))
 `(tab-bar-tab                                   ((,class (:background ,sumi-ink-3 :foreground ,fuji-white))))
 `(tab-bar-tab-inactive                          ((,class (:background ,sumi-ink-0 :foreground ,sumi-ink-4 :height 0.8))))

 ;; centaur-tabs
 `(centaur-tabs-active-bar-face                  ((,class (:background ,spring-blue :foreground ,fuji-white))))
 `(centaur-tabs-selected                         ((,class (:background ,sumi-ink-3 :foreground ,fuji-white :weight bold))))
 `(centaur-tabs-selected-modified                ((,class (:background ,sumi-ink-3 :foreground ,fuji-white))))
 `(centaur-tabs-modified-marker-selected         ((,class (:background ,sumi-ink-3 :foreground ,autumn-yellow))))
 `(centaur-tabs-close-selected                   ((,class (:inherit centaur-tabs-selected))))
 `(tab-line                                      ((,class (:background ,sumi-ink-0))))

 `(centaur-tabs-unselected                       ((,class (:background ,sumi-ink-0 :foreground ,sumi-ink-4))))
 `(centaur-tabs-default                          ((,class (:background ,sumi-ink-0 :foreground ,sumi-ink-4))))
 `(centaur-tabs-unselected-modified              ((,class (:background ,sumi-ink-0 :foreground ,peach-red))))
 `(centaur-tabs-modified-marker-unselected       ((,class (:background ,sumi-ink-0 :foreground ,sumi-ink-4))))
 `(centaur-tabs-close-unselected                 ((,class (:background ,sumi-ink-0 :foreground ,sumi-ink-4))))

 `(centaur-tabs-close-mouse-face                 ((,class (:background unspecified :foreground ,peach-red))))
 `(centaur-tabs-default                          ((,class (:background ,ronin-yellow ))))
 `(centaur-tabs-name-mouse-face                  ((,class (:foreground ,spring-blue :weight bold))))

 `(git-gutter:added                              ((,class (:foreground ,autumn-green))))
 `(git-gutter:deleted                            ((,class (:foreground ,wave-red))))
 `(git-gutter:modified                           ((,class (:foreground ,spring-blue))))

 ;; diff-hl
 `(diff-hl-change                               ((,class (:foreground ,spring-blue :background ,winter-blue))))
 `(diff-hl-delete                               ((,class (:foreground ,peach-red :background ,winter-red))))
 `(diff-hl-insert                               ((,class (:foreground ,comet :background ,winter-blue))))

 `(diff-hl-margin-change                         ((,class (:foreground ,spring-blue :background ,winter-blue))))
 `(diff-hl-margin-delete                         ((,class (:foreground ,peach-red :background ,winter-red))))
 `(diff-hl-margin-insert                         ((,class (:foreground ,comet :background ,winter-blue))))

 `(bm-fringe-face                                ((,class (:background ,peach-red :foreground ,sumi-ink-3))))
 `(bm-fringe-persistent-face                     ((,class (:background ,peach-red :foreground ,sumi-ink-3))))

 `(ansi-color-green                              ((,class (:foreground ,spring-green))))
 `(ansi-color-black                              ((,class (:background ,sumi-ink-0))))
 `(ansi-color-cyan                               ((,class (:foreground ,wave-aqua-2))))
 `(ansi-color-magenta                            ((,class (:foreground ,sakura-pink))))
 `(ansi-color-blue                               ((,class (:foreground ,crystal-blue))))
 `(ansi-color-red                                ((,class (:foreground ,peach-red))))
 `(ansi-color-white                              ((,class (:foreground ,fuji-white))))
 `(ansi-color-yellow                             ((,class (:foreground ,autumn-yellow))))
 `(ansi-color-bright-white                       ((,class (:foreground ,old-white))))
 `(ansi-color-bright-white                       ((,class (:foreground ,old-white))))

 `(tree-sitter-hl-face:attribute                 ((,class (:foreground ,surimi-orange))))
 `(tree-sitter-hl-face:escape                    ((,class (:foreground ,wave-red))))
 `(tree-sitter-hl-face:constructor               ((,class (:foreground ,wave-red :weight semi-bold))))

 `(tree-sitter-hl-face:constant                  ((,class (:foreground ,surimi-orange))))
 `(tree-sitter-hl-face:constant.builtin          ((,class (:foreground ,carp-yellow :weight semi-bold))))

 `(tree-sitter-hl-face:embedded                  ((,class (:foreground ,boat-yellow-2))))


 `(tree-sitter-hl-face:function.builtin          ((,class (:foreground ,peach-red :slant italic :background ,winter-red))))
 `(tree-sitter-hl-face:function.call             ((,class (:foreground ,spring-violet-2))))
 `(tree-sitter-hl-face:function.macro            ((,class (:foreground ,samurai-red))))
 `(tree-sitter-hl-face:function.special          ((,class (:foreground ,sakura-pink))))
 `(tree-sitter-hl-face:function.label            ((,class (:foreground ,surimi-orange))))

 `(tree-sitter-hl-face:method                    ((,class (:foreground ,light-blue))))
 `(tree-sitter-hl-face:method.call               ((,class (:foreground ,light-blue))))

 `(tree-sitter-hl-face:property                  ((,class (:foreground ,carp-yellow))))
 `(tree-sitter-hl-face:property.definition       ((,class (:foreground ,old-white :slant italic))))

 `(tree-sitter-hl-face:tag                       ((,class (:foreground ,peach-red))))

 `(tree-sitter-hl-face:type                      ((,class (:foreground ,wave-aqua-2 :weight semi-bold))))
 `(tree-sitter-hl-face:type.argument             ((,class (:foreground ,surimi-orange))))
 `(tree-sitter-hl-face:type.builtin              ((,class (:foreground ,autumn-red))))
 `(tree-sitter-hl-face:type.parameter            ((,class (:foreground ,surimi-orange))))
 `(tree-sitter-hl-face:type.super                ((,class (:foreground ,samurai-red :weight bold))))

 `(tree-sitter-hl-face:variable                  ((,class (:foreground ,spring-blue :slant italic))))
 `(tree-sitter-hl-face:variable.builtin          ((,class (:foreground ,wave-red))))
 `(tree-sitter-hl-face:variable.parameter        ((,class (:foreground ,spring-violet-2 :slant italic))))
 `(tree-sitter-hl-face:variable.special          ((,class (:foreground ,surimi-orange))))
 `(tree-sitter-hl-face:variable.synthesized      ((,class (:foreground ,light-blue))))

 `(tree-sitter-hl-face:number                    ((,class (:foreground ,sakura-pink))))
 `(tree-sitter-hl-face:operator                  ((,class (:foreground ,sakura-pink :weight bold))))

 `(tree-sitter-hl-face:punctuation               ((,class (:foreground ,light-blue))))
 `(tree-sitter-hl-face:punctuation.bracket       ((,class (:foreground ,spring-violet-2 :slant italic))))
 `(tree-sitter-hl-face:punctuation.delimiter     ((,class (:foreground ,spring-violet-2 :slant italic))))
 `(tree-sitter-hl-face:punctuation.special       ((,class (:foreground ,peach-red))))

 `(tree-sitter-hl-face:case-pattern              ((,class (:foreground ,wave-red))))
 `(tree-sitter-hl-face:variable.synthesized      ((,class (:foreground ,wave-red))))
 `(tree-sitter-hl-face:keyword.compiler          ((,class (:foreground ,peach-red :slant italic))))

 `(focus-unfocused                               ((,class (:foreground ,sumi-ink-4)))))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'kanagawa-paper)
