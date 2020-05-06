# This indicates that the script should be run in the bash shell regardless
# of which interactive shell the user has chosen. THis is very important
# since the syntax of different shells can vary greatly.
#!/bin/bash
echo "hello, $USER. I wish to list some files of yours"
echo "listing files in the current directory, $PWD"
ls # list files
