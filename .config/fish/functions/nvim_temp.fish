function nvim_temp
    if count $argv > /dev/null
        if test $argv[1] = "."
            nvim -c "Dashboard|NvimTreeOpen"
        else
            nvim $argv
        end
    else
        nvim
    end
end
