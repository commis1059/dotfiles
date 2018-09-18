package "bash-completion"

file "#{HOME_DIR}/.bash_profile" do
  action :edit

  block do |content|
    content << <<-EOS

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
    EOS
  end

  not_if "test -f $(brew --prefix)/etc/bash_completion"
end
