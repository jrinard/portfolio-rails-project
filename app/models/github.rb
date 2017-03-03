class Github < ApplicationController

  def get_projects
    response = HTTParty.get("https://api.github.com/users/jrinard/repos?sort=pushed&per_page=100&access_token=" + ENV['AUTH_TOKEN'],
                headers: {"User-Agent" => "profile"
                })

  end

end
