#!/bin/bash

# This checks if the number of arguments is correct
# If the number of arguments is incorrect ( $# != 2) print error message and exit
if [[ $# != 2 ]]
then
  echo "backup.sh target_directory_name destination_directory_name"
  exit
fi

# This checks if argument 1 and argument 2 are valid directory paths
if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid directory path provided"
  exit
fi

# Set two variables equal to the values of the first and second command line arguments
targetDirectory="$1"
destinationDirectory= "$2"

# Display the values of the two command line arguments in the terminal
echo "The value of targetDirectory is: $targetDirectory"
echo "The value of destinationDirectory is: $destinationDirectory"

#  the current timestamp, expressed in seconds
currentTS= '$(date +%s)'

# to store the name of the archived and compressed backup file that the script will create
backupFileName="backup-[$currenTS].tar.gz"

# We're going to:
  # 1: Go into the target directory
  # 2: Create the backup file
  # 3: Move the backup file to the destination directory


origAbsPath='$(pwd)'


cd <- destDirAbsPath=$destinationDirectory


cd  <-$origAbsPath
cd  <-$targetDirectory

yesterdayTS=$((currentTS + 24 * 60 * 60)) 

declare -a toBackup

for file in $(ls) 
do
  
  if (( `date -r $file +%s` > $yesterdayTS ))
  then
    
    toBackup+=($file)
  fi
done


tar -czvf $backupFileName ${toBackup[@]}


mv "$backupFileName" "$destAbsPath"