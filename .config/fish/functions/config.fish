# Defined in - @ line 1
function config --wraps='/usr/bin/git --git-dir=/home/ecal/.cfg/ --work-tree=/home/ecal' --wraps='/usr/bin/git --git-dir=/home/ecal/.cfg/ --work-tree=/home/ecal ' --description 'alias config=/usr/bin/git --git-dir=/home/ecal/.cfg/ --work-tree=/home/ecal'
  /usr/bin/git --git-dir=/home/ecal/.cfg/ --work-tree=/home/ecal $argv;
end
