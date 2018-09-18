class MItamae::RecipeContext

  HOME_DIR = `printenv HOME`.chomp

  def include_cookbook(name)
    root_dir = File.expand_path('..', __FILE__)
    include_recipe File.join(root_dir, 'cookbooks', name, 'default')
  end

  def include_role(name)
    root_dir = File.expand_path('..', __FILE__)
    include_recipe File.join(root_dir, 'roles', name, 'default')
  end

end

# Copy the app in the dmg to /Applications
# @example
# execute_app_install "Google Chorme" do
#   url "https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg"
# end
define :execute_app_install, url: nil do
  name = params[:name]
  url = params[:url]

  execute name do
    command <<-EOS
curl -L "#{url}" -o "#{name}.dmg"
mount_dir=`hdiutil attach "#{name}.dmg" | tail -n 1 | cut -f 3`
sudo ditto "${mount_dir}/#{name}.app" "/Applications/#{name}.app"
hdiutil detach "${mount_dir}"
rm "#{name}.dmg"
    EOS

    not_if "test -e '/Applications/#{name}.app'"
  end if name && url
end

# Execute installer in the dmg
# @example
# execute_pkg_install "GoogleJapaneseInput" do
#   url "https://dl.google.com/japanese-ime/latest/GoogleJapaneseInput.dmg"
#   not_if_cmd "test -e /Applications/GoogleJapaneseInput.localized/UninstallGoogleJapaneseInput.app"
# end
define :execute_pkg_install, url: nil, not_if_cmd: nil do
  name = params[:name]
  url = params[:url]
  not_if_cmd = params[:not_if_cmd]

  execute name do
    command <<-EOS
curl -L "#{url}" -o "#{name}.dmg"
mount_dir=`hdiutil attach "#{name}.dmg" | tail -n 1 | cut -f 3`
sudo installer -pkg "${mount_dir}/#{name}.pkg" -target /
hdiutil detach "${mount_dir}"
rm "#{name}.dmg"
    EOS

    not_if not_if_cmd if not_if_cmd
  end if name && url
end

# Unzip the zipped app in the dmg to /Applications
# @example
# execute_zip_install "iTerm" do
#   url "https://iterm2.com/downloads/stable/latest"
# end
define :execute_zip_install, url: nil do
  name = params[:name]
  url = params[:url]

  execute name do
    command <<-EOS
curl -L "#{url}" -o "#{name}.zip"
sudo unzip "#{name}.zip" -d /Applications
rm "#{name}.zip"
    EOS

    not_if "test -e '/Applications/#{name}.app'"
  end if name && url
end

# brew install with version and add path to bin
# @example
# package_with_version "node" do
#   version "8"
# end
define :package_with_version, version: nil do
  name = params[:name]
  version = params[:version]

  package "#{name}@#{version}" do
    version version
  end

  file "#{HOME_DIR}/.bash_profile" do
    action :edit

    block do |content|
      content << <<-EOS

export PATH="/usr/local/opt/#{name}@#{version}/bin:$PATH"
      EOS
    end

    not_if <<-EOS
grep -q 'export PATH="/usr/local/opt/#{name}@#{version}/bin:$PATH"' ~/.bash_profile
    EOS
  end
end

include_role node[:platform]
