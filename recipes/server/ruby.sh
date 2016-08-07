curl -L https://get.rvm.io | bash -s stable --ruby
source ~/.rvm/scripts/rvm
gem install bundler
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' >> ~/.bash_profile
