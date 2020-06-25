class GitService < ApplicationRecord


    ## this method fetches from the github api. If a user is found, 
    ## their name, email, and repo count are returned in a hash. If 
    ## a user is not found, an erro rmessage is returned.

    def self.get_git_info(username)
        response = HTTParty.get('https://api.github.com/users/' + username).to_json
        json = JSON.parse(response)
        if json["login"]
            return {
                name: json["name"],
                email: json["email"],
                public_repo_count: json["public_repos"]
            }
        else 
            return {
                error: "User Not Found"
            }
        end
    end
end
