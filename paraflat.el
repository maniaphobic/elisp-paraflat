(defun pf/flatten (&optional begin end)
  "Flatten paragraphs in a region, replacing newlines with spaces
in each paragraph. If no region is active, flatten between point
and the buffer's end."
  (interactive)
  (let ((fill-column (point-max))
	(region (if (use-region-p)
		    ((region-beginning) . (region-end))
		  ((point) . (point-max))))
	)
    (fill-region (car region) (cdr region))
    ))
