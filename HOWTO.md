# Compiling with bibliography

    xelatex FA_DM 
    bibtex FA_DM
    xelatec FA_DM
    xelatex FA_DM 

# Simple compilation 
Simply run 

    xelatex FA_DM

Mac users may want to run 

    xelatex FA_DM
    open -a skim  FA_DM.pdf"

Or, alternatively, the run_on_mac.sh script

# HTML output
run 

    hevea FA_DM
    hevea FA_DM
    # Second run is optional: We only need it to get/update cross-references

You will to have to comment/uncomment in the FA_DM.tex before, 
see lines 22, …, 25 in FA_DM.tex. Hint: grep -r "HEVEA" . *.tex

If it fails, then run 

    rm *.aux

before you try again.


