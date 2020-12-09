function configu
config fetch
config add -u
config commit -m "$argv"
and config push
and echo "config repo updated."
or echo "config repo not changed. aborting..."
end
