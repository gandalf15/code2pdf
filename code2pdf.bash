#!/usr/bin/env bash

code2ps() {
    if [[ "${1}" == "" ]]
    then
        echo "ERROR: missing argument \n code2ps [targetfile]"
    else
        vim -c "set printoptions=number:y" -c "syntax on" -c "hardcopy > ${1}.ps" -c "q" ${1}
    fi
}

code2pdf() {
    in_file="${1}"      #input filename
    ps_file="${1}.ps"   #filename.ps
    pdf_file="${1}.pdf" #filename.pdf

    if [[ $in_file == "" ]]
    then
        echo "ERROR: missing argument \n code2pdf [targetfile]"
    else
        code2ps $in_file #convert code to .ps
        ps2pdf $ps_file $pdf_file #convert .ps to .pdf
        rm $ps_file #remove .ps 
    fi
}