class GitUser < ApplicationRecord


    ## this method fetches from the github api. If a user is found, 
    ## a new git_user is created within the database with the 
    ## corresponding information. Otherwise, return false.

    def self.get_git_info(username)
        response = HTTParty.get('https://api.github.com/users/' + username).to_json
        json = JSON.parse(response)
        if json["login"]
            git_user_info = {
                name: json["name"],
                email: json["email"],
                public_repo_count: json["public_repos"],
                username: username
            }
            @git_user = GitUser.create(git_user_info)
            return @git_user
        else 
            return false
        end
    end
end
