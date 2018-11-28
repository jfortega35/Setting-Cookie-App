require "erb"

class SettingCookiesApp
  def call(env)
    @request = Rack::Request.new(env)
    case @request.path
      when "/" then Rack::Response.new(render("index.html.erb"))
      when "/countme"
        Rack::Response.new do |response|
          check = @request.cookies["count"].nil? ? 1 : @request.cookies["count"].to_i + 1
          response.set_cookie("count", check)
          response.redirect("/")
        end
      else Rack::Response.new("Not Found", 404)
      end
  end

  def render(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end

  def count_cookie
    @request.cookies["count"] || "Something went wrong"
  end
end
