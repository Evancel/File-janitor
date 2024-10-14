#!/usr/bin/env bash
echo -e "File Janitor, 2024 \nPowered by Bash\n"
if [ -z $1 ]; then
	echo -e "Type file-janitor.sh help to see available options"

elif [[ -n $2 && ! -d $2 && ! -e $2 ]]; then
	echo -e "$2 is not found"
elif [[ -n $2 && ! -d $2 && -e $2 ]]; then
	echo -e "$2 is not a directory"

elif [ $1 = list ]; then
	if [ -z $2 ]; then
		dir="./"
		descr_dir="the current directory"
	elif [ -d $2 ]; then
		dir=$2
		descr_dir=$dir
	fi

	echo -e "Listing files in $descr_dir\n"
	ls -A1 $dir


elif [ $1 = report ]; then
#define directory
	if [ -z $2 ]; then
		dir="./"
		descr_dir="The current directory"
	elif [ -d $2 ]; then
		dir=$2
		descr_dir=$dir
	fi

#count files	
	count_tmp_files=$(find $dir -maxdepth 1 -name "*.tmp" | wc -l) 
	size_tmp_files=$(find $dir -maxdepth 1 -name "*.tmp" -exec cat {} \+| wc -c)
	count_log_files=$(find $dir -maxdepth 1 -name "*.log" | wc -l) 
	size_log_files=$(find $dir -maxdepth 1 -name "*.log" -exec cat {} \+| wc -c)
	count_py_files=$(find $dir -maxdepth 1 -name "*.py" | wc -l) 
	size_py_files=$(find $dir -maxdepth 1 -name "*.py" -exec cat {} \+| wc -c)

	echo -e "$descr_dir contains: 
$count_tmp_files tmp file(s), with total size of $size_tmp_files bytes 
$count_log_files log file(s), with total size of $size_log_files bytes 
$count_py_files py file(s), with total size of $size_py_files bytes"


elif [ $1 = clean ]; then
#define directory
	if [ -z $2 ]; then
		dir="./"
		descr_dir="the current directory"
	elif [ -d $2 ]; then
		dir=$2
		descr_dir=$dir
	fi

#start message
	echo -e "Cleaning $descr_dir..."

#process log files
	echo -n "Deleting old log files... "
	cnt_log_files=$(find $dir -maxdepth 1 -type f -name "*.log" -mtime +3 | wc -l)
	dir_exists=$(find $dir -type d -name logs.tar.gz)
	if [ -z $dir_exists ]; then
#Create an Uncompressed .tar Archive
		find $dir -maxdepth 1 -type f -name "*.log" -mtime +3 -exec tar cf logs.tar.gz {} \;	
	else
#Append Another File to the Existing .tar Archive
		find $dir -maxdepth 1 -type f -name "*.log" -mtime +3 -exec tar rf logs.tar.gz {} \;
	fi
#Deleting files
	find $dir -maxdepth 1 -type f -name "*.log" -mtime +3 -exec rm {} \;
echo -e "done! $cnt_log_files files have been deleted"

#process tmp files
	echo -n "Deleting temporary files... "
	cnt_tmp_files=$(find $dir -maxdepth 1 -type f -name "*.tmp" | wc -l)
	find $dir -maxdepth 1 -type f -name "*.tmp" -exec rm {} \;
echo -e "done! $cnt_tmp_files files have been deleted"

#process py files
	cnt_py_files=$(find $dir -maxdepth 1 -type f -name "*.py" | wc -l)
	echo -n "Moving python files... "
	if [ "$cnt_py_files" -gt "0" ]; then
#check and/or create a directory
		py_dir_exists=$(find $dir -type d -name python_scripts)
		if [ -z $py_dir_exists ]; then
			mkdir $dir/python_scripts
		fi
		find $dir -maxdepth 1 -type f -name "*.py" -exec mv {} $dir/python_scripts \;
	fi
	echo -e "done! $cnt_py_files files have been moved"

#final message
	echo -e "\nClean up of $descr_dir is complete!"


elif [ $1 = help ]; then
	cat "file-janitor-help.txt"
else
	echo -e "Type file-janitor.sh help to see available options"
fi