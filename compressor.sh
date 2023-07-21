#!/bin/bash

while getopts t:p:q:d: flag; do
    case "${flag}" in
    t) TYPE=${OPTARG} ;;
    p) PROPORTION=${OPTARG} ;;
    q) QUALITY=${OPTARG} ;;
    d) DIRECTORY=${OPTARG} ;;
    esac
done

if [ -z "$DIRECTORY" ]; then
    echo -e "\nUsage:\n ./compressor.sh -t [type] -p [proportion] -q [quality] -d [directory]\n"
    echo -e "\n# Where:"
    echo -e "- type: Extension of file like jpg, png or others."
    echo -e "- proportion: Proportion of image like 50, 80 or others."
    echo -e "- quality: Quality of image like 50, 80 or others."
    echo -e "- directory: Path of directory like /home/user/images."
    echo -e "\n# Example:"
    echo -e " compressor.sh -t jpg -p 50 -q 80 -d /home/user/images\n"
    exit 1
fi


function compressRecursively() {
    for file in "$1"/*; do
        if [ ! -d "${file}" ]; then
            if [ ${file: -4} == ".${TYPE}" ]; then
                convert -resize "${PROPORTION}"% -quality "${QUALITY}" "${file}" "${file}"
                echo "${file} - COMPRESSED!"
            fi
        else
            echo "# Entending Folder: ${file}"
            compressRecursively "${file}"
            cd ..
        fi
    done
    echo "............... Folder Done ..............."
}


function main() {
    echo "Starting compression..."
    sleep 1
    echo ""
    echo "Compressing images type: .$TYPE, proportion: $PROPORTION%, quality: $QUALITY% recursively on: $DIRECTORY"
    sleep 1
    echo "..."
    compressRecursively "$1"

    echo "........Compression finished!................"
}

main "$DIRECTORY"




