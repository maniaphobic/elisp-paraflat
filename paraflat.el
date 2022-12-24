;;; This library replaces newlines with spaces in text formatted as
;;; paragraphs delimited by consecutive newlines
;;;
;;; Example: pf/flatten-paragraphs would replace this text:
;;;
;;;   1.1
;;;   1.2
;;;   
;;;   
;;;   
;;;   2.1
;;;   2.2
;;;
;;; with:
;;;
;;;   1.1 1.2
;;;   
;;;   2.1 2.2

(defun pf/extract-region (&optional begin end)
  "Remove the buffer region between BEGIN and END and return it as
a string, without its text properties. When neither parameter is
specified, extract the region between point and the buffer's
end (point-max).

This function wraps delete-and-extract-region, using
substring-no-properties to strip text properties."
  (substring-no-properties
   (delete-and-extract-region begin end))
  )

(defun pf/split-paragraphs (text &optional delimiter)
  "Split TEXT into paragraphs. Absent the optional DELIMITER, split on two or more consecutive newlines."
  (split-string text "\n\\{2,\\}")
  )

(defun pf/collapse-lines (text)
  "Replace each newline in TEXT with a space."
  (string-replace "\n" " " text)
  )

(defun pf/join-paragraphs (lines)
  "Join LINES, a list of strings, into paragraphs using two consecutive newlines. The result is a single string."
  (string-join lines "\n\n")
  )

(defun pf/flatten-paragraphs (&optional begin end)
  "Replace text in newline-delimited paragraphs with spaces. The
function considers two or more consecutive newlines a delimiter
when splitting paragraphs. It re-joins paragraphs with exactly
two newlines.

BEGIN and END optionally specify a buffer region to
flatten. Absent those parameters, flatten the paragraphs between
point and the end of the buffer."
  (interactive)
  (insert
   (pf/join-paragraphs
    (mapcar 'pf/collapse-lines
	    (pf/split-paragraphs
	     (pf/extract-region (point) (point-max)))
	    )
    )
   )
  )
