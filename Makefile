install: install-vim install-git

install-vim:
	rm -rf ~/.vim ~/.vimrc
	mkdir ~/.vim
	ln -s `pwd`/vim/vimrc ~/.vimrc
	ln -s `pwd`/vim/snippets ~/.vim/snippets

install-git:
	rm -f ~/.gitconfig
	ln -s `pwd`/git/gitconfig ~/.gitconfig
	rm -f ~/.gitignore_global
	ln -s `pwd`/git/gitignore_global ~/.gitignore_global
