name = "GoogleJapaneseInput"
url = "https://dl.google.com/japanese-ime/latest/GoogleJapaneseInput.dmg"

execute_pkg_install name do
  url url
  not_if_cmd "test -e /Applications/GoogleJapaneseInput.localized/UninstallGoogleJapaneseInput.app"
end
