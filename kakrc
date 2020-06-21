source "%val{config}/plugins/plug.kak/rc/plug.kak"

add-highlighter global/ number-lines -relative
add-highlighter global/ wrap -indent
add-highlighter global/ show-matching
#set-face ,dark-grey+B MatchingChar


set-option global tabstop 4
set-option global indentwidth 2
#set-option global expandtab true
#set-option global incsearch false

map global user y '<a-|> wl-copy<ret>'
map global user p '!wl-paste<ret>'
map global user = '%| indent -kr -brf -ce -cdw -i2 -nsaf -nsai -nsaw -pal<ret>'

map global normal <c-a> ':inc %val{count} +<ret>'
map global normal <c-x> ':inc %val{count} -<ret>'

plug 'chambln/kakoune-kit' config %{
    map global user g ': git status -bs<ret>' -docstring 'git status'
    hook global WinSetOption filetype=git-status %{
        map window normal c ': git commit --verbose<ret>:git status<ret>'
        map window normal l ': git log --oneline --graph<ret>:git status<ret>'
        map window normal d ': -- %val{selections}<a-!><home> git diff<ret>:git status<ret>'
        map window normal D ': -- %val{selections}<a-!><home> git diff --cached<ret>:git status<ret>'
        map window normal a ': -- %val{selections}<a-!><home> git add<ret>:git status<ret>'
        map window normal A ': -- %val{selections}<a-!><home> repl git add -p<ret>:git status<ret>'
        map window normal r ': -- %val{selections}<a-!><home> git reset<ret>:git status<ret>'
        map window normal R ': -- %val{selections}<a-!><home> repl git reset -p<ret>:git status<ret>'
        map window normal o ': -- %val{selections}<a-!><home> git checkout<ret>:git status<ret>'
    }
    hook global WinSetOption filetype=git-log %{
        map window normal d     ': %val{selections}<a-!><home> git diff<ret>'
        map window normal <ret> ': %val{selections}<a-!><home> git show<ret>'
        map window normal r     ': %val{selections}<a-!><home> git reset<ret>'
        map window normal R     ': %val{selections}<a-!><home> repl git reset -p<ret>'
        map window normal o     ': %val{selections}<a-!><home> git checkout<ret>'
    }
}

plug 'occivink/kakoune-gdb'
plug 'alexherbo2/surround.kak'

plug "andreyorst/powerline.kak" config %{
      powerline-start
}

plug "https://gitlab.com/Screwtapello/kakoune-inc-dec" config %{
  map global normal <c-a> \
    ': inc-dec-modify-numbers + %val{count}<ret>'
  map global normal <c-x> \
    ': inc-dec-modify-numbers - %val{count}<ret>'
}

plug "ftonneau/digraphs.kak" %{
  set-option global digraphs_path 'plugins/digraphs.kak'
    digraphs-enable-on <c-k> <c-c>
}


#plug "andreyorst/kaktree" config %{
#    hook global WinSetOption filetype=kaktree %{
#        remove-highlighter buffer/numbers
#        remove-highlighter buffer/matching
#        remove-highlighter buffer/wrap
#        remove-highlighter buffer/show-whitespaces
#    }
#    kaktree-enable
#}

