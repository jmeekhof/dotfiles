function 1p --wraps 1pass --description 'Runs 1pass for using Infrastructure vault'
  1pass -v Eng-Infrastructure -t secrets.yaml-template -e secrets.yaml $argv
end
