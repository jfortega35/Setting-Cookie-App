require "setting_cookies_app"

use Rack::Reloader, 0

run SettingCookiesApp.new

#run Rack::Cascade.new([Rack::File.new("public"), SettingCookiesApp])
