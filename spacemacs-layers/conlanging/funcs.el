;;; funcs.el --- Conlanging Layer functions File for Spacemacs
;;
;; Copyright (c) 2019-2020 Lucien Cartier-Tilet
;;
;; Author: Lucien Cartier-Tilet <phundrak@phundrak.fr>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq latin-to-runes-table '((", ?" . "᛬") ("\\." . "᛭") (" " . "᛫")
                             ("ch" . "ᛇ") ("ae" . "ᚫ") ("ea" . "ᛠ")
                             ("f" . "ᚠ") ("u" . "ᚢ") ("s" . "ᚦ")
                             ("o" . "ᚩ") ("r" . "ᚱ") ("c" . "ᚳ")
                             ("g" . "ᚷ") ("w" . "ᚹ") ("h" . "ᚻ")
                             ("n" . "ᚾ") ("i" . "ᛁ") ("j" . "ᛄ")
                             ("p" . "ᛈ") ("z" . "ᛋ") ("v" . "ᛝ")
                             ("t" . "ᛏ") ("b" . "ᛒ") ("e" . "ᛖ")
                             ("m" . "ᛗ") ("l" . "ᛚ") ("d" . "ᛞ")
                             ("é" . "ᛟ") ("a" . "ᚪ") ("y" . "ᚣ")))
(setq latin-to-native-table '(("ch" . "ȝ") ("ae" . "æ") ("s" . "þ")
                              ("z" . "ð") ("w" . "ƿ") ("j" . "i")
                              ("g" . "ᵹ")))
(setq latin-to-latex-runes '((", ?" . ":") ("\\." . "*") (" " . ".")
                             ("ch" . "I") ("ae" . "æ") ("ea" . "\\\\ea")
                             ("z" . "s") ("v" . "\\\\ng") ("é " . "\\\\oe")
                             ("s" . "þ")))

(defun conlanging//replace-string-by-char (t-string t-correspondance-table)
  "Return a copy of t-string converted with the correspondance table"
  (while t-correspondance-table
    (let ((cur-from-char (car (car t-correspondance-table)))
          (cur-to-char (cdr (car t-correspondance-table))))
      (setq t-string (replace-regexp-in-string cur-from-char
                                               cur-to-char
                                               t-string))
      (setq t-correspondance-table (cdr t-correspondance-table))))
  t-string)

(defun conlanging//get-boundary ()
  "Get the boundary of either the selected region, or if there is none the
word the cursor is over"
  (interactive)
  (let* ((beg (region-beginning))
         (end (region-end))
         (boundary-word (bounds-of-thing-at-point 'word)))
    (if (= beg end)
        boundary-word
      (cons beg end))))

(defun conlanging//replace-char-by-table (correspondance-table)
  "Replaces selected text’s strings according to the table passed as argument. The
table is a list of pairs, the first element of the pair is a regex to be
searched in the selected text and the second element of the pair the string it
has to be replaced with."
  (let* ((cur-boundary (conlanging//get-boundary))
         (beg (car cur-boundary))
         (end (cdr cur-boundary)))
    (setq regionp (buffer-substring-no-properties beg end))
    (setq regionp (conlanging//replace-string-by-char regionp
                                                      correspondance-table))
    (delete-region beg end)
    (goto-char beg)
    (insert regionp)))


(defun conlanging/matter-to-runes ()
  "Replaces translitterated Mattér to its runic writing system"
  (interactive)
  (conlanging//replace-char-by-table latin-to-runes-table))

(defun conlanging/matter-to-native-latin ()
  "Replaces translitterated Mattér to its native latin writing system"
  (interactive)
  (conlanging//replace-char-by-table latin-to-native-table))

(defun conlanging/matter-to-latex-runes ()
  (interactive)
  (conlanging//replace-char-by-table latin-to-latex-runes))
