function configu
	config fetch
	config add -A
	config commit -m "$argv"
	and config push
	and echo "config repo updated" | cowsay -f meeseeks
	or echo "config repo not changed. aborting..."
end
