function ly --wraps lazygit --description 'Runs lazygit for yadm'
    lazygit -ucd ~/.local/share/lazygit -w ~ -g ~/.local/share/yadm/repo.git
end
