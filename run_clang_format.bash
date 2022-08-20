#!/bin/bash

#set -x

if [ ! -z "$(which git-clang-format)" ] && [ "${CLANG_FORMAT_DISABLE-0}" -ne 1 ]; then

   FMT_CMD_DIFF_ONLY="git-clang-format -q --diff --staged --extensions h,hpp,c,cpp,hxx,cxx"
   FMT_DIFFS=$(eval "${FMT_CMD_DIFF_ONLY}")

   #If clang-format wants to apply formatting changes
   if [ ! -z "${FMT_DIFFS}" ]; then
      echo "[INFO] git-clang-format wants to apply formatting to your commit"
	  if [ ${CLANG_FORMAT_AUTO_APPLY} -ne 1 ]; then
	     echo "       To auto-apply changes in the future, add 'export CLANG_FORMAT_AUTO_APPLY=1' to your .bashrc"
	  fi

      FIRST_ATTEMPT=1
      while [ 1 ]; do
         if [ ${CLANG_FORMAT_AUTO_APPLY} -eq 1 ] && [ ${FIRST_ATTEMPT} -eq 1 ]; then
		    USER_CMD="a"
		 else
	        echo " Enter your selection:"
	        echo " [r] Review formatting changes"
	        echo " [a] Apply formatting changes and commit" 
	        echo " [i] Ignore formatting changes and commit" 
	        echo " [e] Exit and abort commit" 

		    read -p "Selection: " USER_CMD < /dev/tty
	     fi
		 
		 case $USER_CMD in
		    [Rr] )
			   eval "${FMT_CMD_DIFF_ONLY}"
			   ;;
		    [Aa] )
			   git apply --index <(eval "${FMT_CMD_DIFF_ONLY}")
			   RETURN_VAL="$?"
			   if [ "$RETURN_VAL" -eq 0 ]; then
			      echo "[INFO] git-clang-format patch applied successfully"
			      break
			   else
			      echo "[ERROR] git-clang-format patch failed, error: ${RETURN_VAL}"
				  echo "        This may be due to unstaged changes adjacent to code"
				  echo "        being formatted"
			   fi
			   ;;
		    [Ii] )
			   break
			   ;;
		    [Ee] )
			   echo "[INFO] Aborting commit"
			   exit 1
			   ;;
			*)
			   echo "[ERROR] Unexpected selection"
			   ;;
		 esac
		 FIRST_ATTEMPT=0
      done
   fi
else
   echo "[WARN] Could not find git-clang-format"
fi
