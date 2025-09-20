parse_git_branch() {
	local branch=`git branch 2>/dev/null | sed '/^\*/!d;s/\* //'`

	if [ -z $branch ]
	then echo ''
	else
		local stat=`git status -s | wc -l`

		if [[ $stat == 0 ]]
		then echo "$branch "
		else echo "$branch +$stat "
		fi
	fi
}

PS1='\[\e[44m\] \u@\h \[\e[0m\]\[\e[31m\] $(parse_git_branch "%s")\[\e[0m\] \[\e[40m\]\w\[\e[0m\]\n\[\e[32m\]>\[\e[0m\] '
