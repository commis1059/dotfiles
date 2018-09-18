execute "git config --global core.pager" do
  setting = node.dig(:gitconfig, :core, :pager)

  action setting ? :run : :nothing

  command <<-EOS
git config --global core.pager "#{setting}"
  EOS
end

execute "git config --global core.editor" do
  setting = node.dig(:gitconfig, :core, :editor)

  action setting ? :run : :nothing

  command <<-EOS
git config --global core.editor "#{setting}"
  EOS
end

execute "git config --global alias.graph" do
  setting = node.dig(:gitconfig, :alias, :graph)

  action setting ? :run : :nothing

  command <<-EOS
git config --global alias.graph "#{setting}"
  EOS
end

execute "git config --global user.name" do
  setting = node.dig(:gitconfig, :user, :name)

  action setting ? :run : :nothing

  command <<-EOS
git config --global user.name "#{setting}"
  EOS
end

execute "git config --global user.email" do
  setting = node.dig(:gitconfig, :user, :email)

  action setting ? :run : :nothing

  command <<-EOS
git config --global user.email "#{setting}"
  EOS
end
