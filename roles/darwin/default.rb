include_cookbook 'bash_completion'
include_cookbook 'bash_profile'
# include_cookbook 'basic'
include_cookbook 'chrome'
include_cookbook 'flux'
include_cookbook 'google_japanese_input'
include_cookbook 'iterm2'
include_cookbook 'ruby'
include_cookbook 'rubymine'
include_cookbook 'skype'
include_cookbook 'slack'
include_cookbook 'thunderbird'

package 'git'
include_cookbook 'gitconfig'
package_with_version 'mysql' do
  version '5.7'
end
package_with_version 'node' do
  version '8'
end
package 'openssh'
package 'openssl'
package 'telnet'
package 'tree'
package 'yarn' do
  options '--without-node'
end
