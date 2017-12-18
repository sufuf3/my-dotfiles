#!/bin/sh

CAT="/bin/cat"
CHMOD="/bin/chmod"
MKDIR="/bin/mkdir"
TOUCH="/usr/bin/touch"
local="pwd"
ECHO="echo"

github_base='https://raw.githubusercontent.com/'

if  [ $1 = "--reset" ]; then
    echo "Reset to original ENV..."
    for file in gitconfig bashrc bash_profile vimrc gitignore_global tmux.conf wgetrc curlrc
    do
        if [ -e ~/."$file".old ]; then
            mv ~/."$file".old ~/."$file" &
        else
            rm ~/."$file"
        fi
    done
    exit 0
fi

os="$(uname)"
if [ "$os" = "FreeBSD" ];then
    ${ECHO} -e "\n\e[1;36;40mThe operating system is $os\n\e[0m";
    ${ECHO} -e "\n\e[1;36;40mSuppose you have 'fetch' to download files!\n\e[0m";
    download_o='fetch -o'
else
    ECHO="/bin/echo"
    ${ECHO} -e "\n\e[1;36;40mThe operating system is $os\n\e[0m";
    if type "curl" > /dev/null 2>&1; then
        download_o='curl --compressed -#o'
    elif type "wget" > /dev/null 2>&1; then
        download_o='wget --no-timestamping --no-verbose -O '
    else
        echo "Dotfile needs 'wget' or 'curl' to download the assets." 1>&2
    fi
fi

${ECHO} -e "\n\e[1;34;40mDotfile is started to initial the Unix-like working environment...\n\n\e[0m";


${ECHO} -e "\n\e[1;34;40mDownload and setup configs from GitHub...\n\e[0m";
for file in gitconfig bashrc bash_profile vimrc gitignore_global tmux.conf wgetrc curlrc
do
    if [ -e ~/."$file" ] ; then
        if [ ! -e ~/."$file".old ] ; then
            cp ~/."$file" ~/."$file".old
        fi
    fi
    ${CAT} ${file} > ~/."$file" &
done


${ECHO} -e "\n\e[1;34;40mDownload VIM color scheme - Kolor...\n\e[0m";
${download_o} ~/.vim/colors/kolor.vim "${github_base}zeis/vim-kolor/master/colors/kolor.vim" &
${ECHO} -e "\n\e[1;34;40mDownload git's auto completion configs...\n\e[0m";
git_auto_complete_path="${github_base}git/git/master/contrib/completion/git-completion."
${download_o} ~/.git-completion.bash "${git_auto_complete_path}bash"

wait

${ECHO} -e "\n\e[1;34;40mDotfiles setup were finished!\n\nPlease terminate all other works and restart your shell or re-login.\n\e[0m";
