set -x MANPAGER 'nvim +Man!'

function vim
  command nvim $argv
end
