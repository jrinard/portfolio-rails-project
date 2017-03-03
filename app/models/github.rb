class Github < ApplicationController

  def get_projects
    response = HTTParty.get("https://api.github.com/users/jrinard/repos?access_token=" + ENV['AUTH_TOKEN'],
                headers: {"User-Agent" => "profile"
                })
  end

end
