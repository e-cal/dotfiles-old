function mkscript
		echo "#!/usr/bin/bash" > $HOME/scripts/$argv
		chmod a+x $HOME/scripts/$argv
end
