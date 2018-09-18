file "#{HOME_DIR}/.gemrc" do
  action :create

  content <<-EOS
install: --no-document
update: --no-document
  EOS

  not_if "test -e ~/.gemrc"
end

include_recipe "rbenv::user"

file "/Users/#{node[:rbenv][:user]}/.bash_profile" do
  action :edit

  block do |content|
    content << <<-EOS
    
export RBENV_ROOT=~/.rbenv
export PATH="${RBENV_ROOT}/bin:${PATH}"
eval "$(rbenv init -)"
    EOS
  end

  not_if "grep -a RBENV_ROOT /Users/#{node[:rbenv][:user]}/.bash_profile"
end
