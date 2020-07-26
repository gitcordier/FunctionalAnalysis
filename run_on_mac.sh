file_name="FA_DM"
pdf_reader="skim"

xelatex $file_name
open -a $pdf_reader "${file_name}.pdf"

