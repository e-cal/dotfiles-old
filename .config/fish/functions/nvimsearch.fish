function nvimsearch
    if count $argv > /dev/null
        set searchFrom $argv
    else
        set searchFrom "."
    end
    v (find $searchFrom -type f | fzf --preview 'bat --theme=gruvbox --color=always {}')
end
