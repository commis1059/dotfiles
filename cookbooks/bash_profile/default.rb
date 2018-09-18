file "#{HOME_DIR}/.bash_profile" do
  action :edit

  block do |content|
    content << <<-EOS

export PS1='\\W\\$ '

alias ls='ls -G'
alias la='ls -laG'
alias ll='ls -laG'
    EOS
  end

  not_if <<-EOS
grep -q "export PS1='\\\\\\\\W\\\\\\\\$ '" #{HOME_DIR}/.bash_profile
  EOS
end
