for myalias in $(sed 's/^alias //' $HOME/.bash_it/custom/aliases/* | cut -d= -f1 | sort)
do
  complete -F _complete_alias ${myalias}
done
