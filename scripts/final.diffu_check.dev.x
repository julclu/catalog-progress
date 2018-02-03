#!/bin/csh -f


## Written by J. Cluceru on 02.02.18 
## This is a script to check the entire workflow of diffusion processing; 
## what has been run on the scanner & also what has been completed. Please use an input using a path to a .csv file 
## which is formatted to bnum/tnum/DUMMY; there should be no header labeling 
## the bnum/tnum. It must be labeled with the number (#) of bnum/tnum as a .#.csv 

if ($#argv < 1 ) then
    echo ""
    echo "This script is for you to understand what has been completed for anatomical scans."
    echo "The output will be a list of what has been completed."
    echo ""
    echo "An example of it's usage would be /pathtoscript/batch.final.diffu_check.x /pathtobnum_tnumlist/bnumtnumlist.#.csv"
    echo ""
    echo "Please input the path to the list of bnum/tnum you'd like to check. Make sure naming conventions are correct."
    echo ""
    exit(1)
endif

## Check to see if diffusion_b=1000 run, if diffusion_b=1000 folder exists, if _1000_adc exists
## _1000_adca exists, _faa exists, _1000_adca at correct resolution

## checking to see if diffusion_b=1000 run at all: 
set tnum = $1
@ diffu_b1000_seriesnum = `dcm_exam_info -${tnum} | grep '1000' | awk '{print $1}'`
if ($diffu_b1000_seriesnum >= 0) then 
    set diffu_b1000_run = 1
else 
    set diffu_b1000_run = 0
endif





