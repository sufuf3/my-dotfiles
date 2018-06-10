#!/bin/sh

CAT="/bin/cat"
CHMOD="/bin/chmod"
MKDIR="/bin/mkdir"
TOUCH="/usr/bin/touch"

github_base='https://raw.githubusercontent.com/'
repo_path='sufuf3/my-dotfiles/master/'
ECHO="echo"

if  [ $1 = "--reset" ]; then
    echo "Reset to original ENV\n";
    for file in gitconfig bashrc bash_profile vimrc gitignore_global tmux.conf wgetrc curlrc bash_aliases
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
    ${ECHO} -e "\n\e[1;36;40mYour operating system is $os\n\e[0m";
    ${ECHO} -e "\n\e[1;36;40mSuppose you have 'fetch' to download files!\n\e[0m";
    download_o='fetch -o'
else
    ECHO="/bin/echo"
    ${ECHO} -e "\n\e[1;36;40mYour operating system is $os\n\e[0m";
    if type "curl" > /dev/null 2>&1; then
        download_o='curl --compressed -#o'
    elif type "wget" > /dev/null 2>&1; then
        download_o='wget --no-timestamping --no-verbose -O '
    else
        echo "Unitial needs 'wget' or 'curl' to download the assets." 1>&2
    fi
fi

${ECHO} -e "\n\e[1;35;40mDotfile is started to initial the Unix-like working environment...\n\n\e[0m";


${ECHO} -e "\n\e[1;35;40mDownload and setup configs from GitHub...\n\e[0m";
for file in gitconfig bashrc bash_profile vimrc gitignore_global tmux.conf wgetrc curlrc bash_aliases
do
    if [ -e ~/."$file" ] ; then
        if [ ! -e ~/."$file".old ] ; then
            cp ~/."$file" ~/."$file".old
        fi
    fi
    ${download_o} - "${github_base}${repo_path}${file}" | ${CAT} >> ~/."$file" &
done


${ECHO} -e "\n\e[1;35;40mDownload VIM color scheme - Kolor...\n\e[0m";
mkdir -p ~/.vim/colors/
${download_o} ~/.vim/colors/kolor.vim "${github_base}zeis/vim-kolor/master/colors/kolor.vim" &
${ECHO} -e "\n\e[1;35;40mDownload git contrib - diff-highlight...\n\e[0m";
cd ~/ && git clone git://github.com/git/git.git && cd ~/git/contrib/diff-highlight && make && cp ~/git/contrib/diff-highlight/diff-highlight && ${CHMOD} +x ~/.git/contrib/diff-highlight &
cd ~/ && rm -rf ~/git
#${download_o} ~/.git/contrib/diff-highlight "${github_base}git/git/master/contrib/diff-highlight/diff-highlight" && ${CHMOD} +x ~/.git/contrib/diff-highlight &
${ECHO} -e "\n\e[1;35;40mDownload git's auto completion configs...\n\e[0m";
#git_auto_complete_path="${github_base}git/git/master/contrib/completion/git-completion."
#${download_o} ~/.git-completion.bash "${git_auto_complete_path}bash"
${download_o} ~/.git-completion.bash "https://raw.githubusercontent.com/git/git/4ce72180abe72dbb40f5e6a517deea814014e005/contrib/completion/git-completion.bash"
${ECHO} -e "\n\e[1;35;40mDownload golang vim configs...\n\e[0m";
mkdir -p ~/.vim/autoload/
${download_o} ~/.vim/colors/plug.vim "${github_base}junegunn/vim-plug/master/plug.vim" &
mkdir -p ~/.vim/plugged/
git clone https://github.com/fatih/vim-go.git ~/.vim/plugged/vim-go
wait

${ECHO} -e "\n\e[1;35;40mDotfiles setup was finished!\n\nPlease terminate all other works and restart your shell or re-login.\n\e[0m";
