#!/bin/sh

# -- variable declearations
#PERSOL_WELCOME_MESSAGE="Hello persol Client, am here for you"
#echo $PERSOL_WELCOME_MESSAGE

#-- read input
#echo What is your First Name ?
#read FIRST_NAME
#echo What is you Last Name ?
#read LAST_NAME
#echo "Your FirstName is $FIRST_NAME , and your Lastname is $LAST_NAME .  Thanks"


#-- create a file
#echo "What is your name?"
#read USER_NAME
#echo "Hello $USER_NAME"
#echo "I will create you a file called ${USER_NAME}_file"
#touch "${USER_NAME}_file"

#echo what is your folder name ?
#read FLD_NAME

#echo "we are now creating yor folder for you...."
#mkdir "$FLD_NAME"

# echo "===================================================="
# echo "======= Welcome to persol Task Manager System ======"
# echo "===================================================="
# echo "1. Create a File"
# echo "2. Create Folder"
# echo "3. Exist \n"

# echo  "Kindly choose the following."
# read INPUT_INTEGER

# while [ "$INPUT_INTEGER" != 3 ]
# do
	# if  [ "$INPUT_INTEGER" == 1 ]; then
	 # echo "Creating file now"
	 # touch "Project_file"
	 # elif  "$INPUT_INTEGER" == 2 ]; then
	   # echo "Something else"
	   # mkdir "Folder_FOLDER"
	 # else
	   # echo "None of the above"
	# fi
  # #mkdir "Folder"
  # #echo "Please type something in (bye to quit)"
  # read INPUT_INTEGER
  # #echo "You typed: $INPUT_INTEGER"
# done

# myfunc()
# {
  # echo "\$1 is $1"
  # echo "\$2 is $2"
  # # cannot change $1 - we'd have to say:
  # # 1="Goodbye Cruel"
  # # which is not a valid syntax. However, we can
  # # change $a:
  # a="Goodbye Cruel"
# }

# ### Main script starts here 

# a=Hello
# b=World
# myfunc $a $b
# echo "a is $a"
# echo "b is $b"


# echo "Server Ready"
# sudo php artisan serve;
# echo "Migration Started";
# sudo php artisan migrate;
# echo "migration Finished Successfuly";

#Identify what in the path variable in the context of your script
# * * * * * echo $PATH > ~/cron.log

# #Identify the shell being use in your script
# * * * * * echo $SHELL > ~/cron.log

# #Identify the working directory your cron job natively executes in
# * * * * * echo $PATH > ~/cron.log


#Script to create a specific-directory on all subfolders in a parent-directory

path=/path/to-the/parent/directory

while read project
do
  echo "$foldersname"
  cd $path/$foldername/
  mkdir Folder-name-to-be-created
done < foldername.txt
