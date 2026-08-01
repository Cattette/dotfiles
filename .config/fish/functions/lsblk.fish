function lsblk --description 'alias lsblk=lsblk | bat -l conf -p'
    command lsblk | bat -l conf -p $argv
end
