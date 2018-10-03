alias dk='docker '
alias dkp='docker pull '
alias dkb='docker build '
alias dki='docker images '
alias dkr='docker run '
alias dkri='docker run -it --rm '
alias dks='docker start '
alias dkS='docker stop '
alias dkst='docker stats '
alias dkps='docker ps -a '
alias dkrm='docker rm '
alias dkrma='docker rm -f $(docker ps -aq)'
alias dkrmi='docker rmi '
alias dkrmid='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'

alias dkc='docker-compose '
alias dkcu='docker-compose up '
alias dkcub='docker-compose up --build'
alias dkcd='docker-compose down'
alias dkcr='docker-compose run '

alias dkm='docker-machine '
alias dkmc='docker-machine create -d virtualbox '
alias dkme='docker-machine env '
alias dkml='docker-machine ls '
alias dkms='docker-machine start '
alias dkmS='docker-machine stop '

alias dkmu='__docker-machine_use '
