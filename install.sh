UNAME=$( uname )

READLINK=$( which readlink )
function abspath { readlink -f ${1} ; }
if [ -z ${READLINK} ]; then READLINK=$( which greadlink ) ; function abspath { greadlink -f ${1} ; } ; fi
if [ -z ${READLINK} ]; then READLINK=$( which  realpath ) ; function abspath { realpath -s ${1} ; } ; fi
if [ -z ${READLINK} ]; then function abspath { python -c "import argparse, os, sys ; print( os.path.realpath(sys.argv[1]) )" ${1} ; } ; fi

SCRIPT=$( abspath ${0} ) #| awk '{gsub(/ /,"\ "); print}' )"
MAIN=$( dirname "$SCRIPT" )

## Installing third party software
cd third_party
#bash install
cd ../



## Note to user
echo "
To use humdrummer, modify path:
"
echo "export" $( echo "PATH=${MAIN}:\${PATH}" | awk '{gsub(" ","\\ "); print}' )
echo
