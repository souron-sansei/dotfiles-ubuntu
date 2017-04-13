DOT_FILES=( .zshrc .zshrc.env .gitconfig .screenrc .vimrc .vim .tmux.conf .tmux-powerline .hgrc )

for file in ${DOT_FILES[@]}
do
	ln -s -i $HOME/dotfiles-ubuntu/$file $HOME/$file
done

#NeoVim
dir=$HOME/.config; [ ! -e $dir ] && mkdir -p $dir
ln -s -i $HOME/dotfiles-ubuntu/.config/nvim $HOME/.config/
#ln -nsf ~/.dotfiles/config/nvim ~/.config/

# Neobundle
[ ! -d $HOME/.vim/bundle ] && git clone https://github.com/Shougo/neobundle.vim.git $HOME/.vim/bundle/neobundle.vim
[ ! -d $HOME/.vim/bundle/vimproc.vim ] && git clone https://github.com/Shougo/vimproc.vim.git $HOME/.vim/bundle/vimproc.vim

cd $HOME/.vim/bundle/vimproc.vim && make -f make_unix.mak
vim -u $HOME/.vimrc -i NONE -c "try | NeoBundleUpdate! | finally | q! | endtry" -e -s -V1
function askYesOrNo {
  MSG=$1
  while :
  do
    echo -n "${MSG} y/N: "
    read ans
    case $ans in
    [yY]) return 0 ;;
    [nN]) return 1 ;;
    esac
  done
}
