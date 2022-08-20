#!/bin/bash

if [ ! -z "$(which git-clang-format)" ]; then

   FMT_CMD="git-clang-format -q --staged --diff --extensions h,hpp,c,cpp,hxx,cxx"
   FMT_CMD_DIFF_ONLY="${FMT_CMD} --diff"

   FMT_DIFFS=$(eval "${FMT_CMD_DIFF_ONLY}")

   if [ ! -z "${FMT_DIFFS}" ]; then
      echo "[INFO] git-clang-format wants to apply formatting to your commit."
	  echo "       To auto-apply changes in the future, add 'export CLANG_FORMAT_AUTO_APPLY=1' to your .bashrc"

      while [ 1 ]; do
	     echo " Enter your selection:"
	     echo " [r] Review formatting changes"
	     echo " [a] Apply formatting changes" 
	     echo " [i] Ignore formatting changes" 
	     echo " [e] Exit and abort commit" 

	     read -p "Selection: " USER_CMD < /dev/tty
		 
		 case $USER_CMD in
		    [Rr] )
			   eval "${FMT_CMD_DIFF_ONLY}"
			   ;;
		    [Aa] )
			   eval "${FMT_CMD}"
			   break
			   ;;
		    [Ii] )
			   break
			   ;;
		    [Ee] )
			   echo "[INFO] Aborting commit"
			   exit 1
			   ;;
			*)
			   echo "[INFO] Unexpected selection"
			   ;;
		 esac
      done
   fi
else
   echo "[WARN] Could not find git-clang-format"
fi
