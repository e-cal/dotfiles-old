function configu
		config add -A
		config commit -m "$argv"
		and config push
		switch $status
				case 0
						echo "Changes sucessfully pushed!" | cowsay -f bobross
				case '*'
						begin
								set_color red
								echo "Changes not pushed."
								set_color normal
						end
		end
end
