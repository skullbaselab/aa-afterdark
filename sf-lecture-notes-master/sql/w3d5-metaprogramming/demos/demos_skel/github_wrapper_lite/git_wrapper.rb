require 'faraday'
require 'json'
class GitWrapper
  def self.repo_meta(owner = 'rails', repo_name = 'rails')
  ####################################
  ######### Hit GitHub API ###########
  ####################################
  # To fetch github api directly rather than hardcoded values uncomment the following code
  #   conn = Faraday.new(url: "https://api.github.com/repos/#{owner}/#{repo_name}") do |faraday|
  #     faraday.request  :url_encoded
  #     faraday.adapter  Faraday.default_adapter
  #   end
  #   ## You will need a github token to make this work.
  #   response = conn.get do |req|
  #     req.headers['Authorization'] = ENV['GITHUB_TOKEN']
  #   end
  #   JSON.parse(response.body)

  ####################################
  ### Use Static Hardcoded values ####
  ####################################
  #  Comment the next line if you want to try
  #  out githubs API
  REPO_HASH

  end


REPO_HASH = {
  "id"=>8514,
  "name"=>"rails",
  "full_name"=>"rails/rails",
  "owner"=>{
    "login" => "rails",
    "id"=>4223,
    "avatar_url"=>"https://avatars1.githubusercontent.com/u/4223?v=4",
    "gravatar_id"=>"",
    "url"=>"https://api.github.com/users/rails",
    "html_url"=>"https://github.com/rails",
    "followers_url"=>"https://api.github.com/users/rails/followers",
    "following_url"=>"https://api.github.com/users/rails/following{/other_user}",
    "gists_url"=>"https://api.github.com/users/rails/gists{/gist_id}",
    "starred_url"=>"https://api.github.com/users/rails/starred{/owner}{/repo}",
    "subscriptions_url"=>"https://api.github.com/users/rails/subscriptions",
    "organizations_url"=>"https://api.github.com/users/rails/orgs",
    "repos_url"=>"https://api.github.com/users/rails/repos",
    "events_url"=>"https://api.github.com/users/rails/events{/privacy}",
    "received_events_url"=>"https://api.github.com/users/rails/received_events",
    "type"=>"Organization",
    "site_admin"=>false
  },
  "private"=>false,
  "html_url"=>"https://github.com/rails/rails",
  "description"=>"Ruby on Rails",
  "fork"=>false,
  "url"=>"https://api.github.com/repos/rails/rails",
  "forks_url"=>"https://api.github.com/repos/rails/rails/forks",
  "keys_url"=>"https://api.github.com/repos/rails/rails/keys{/key_id}",
  "collaborators_url"=>"https://api.github.com/repos/rails/rails/collaborators{/collaborator}",
  "teams_url"=>"https://api.github.com/repos/rails/rails/teams",
  "hooks_url"=>"https://api.github.com/repos/rails/rails/hooks",
  "issue_events_url"=>"https://api.github.com/repos/rails/rails/issues/events{/number}",
  "events_url"=>"https://api.github.com/repos/rails/rails/events",
  "assignees_url"=>"https://api.github.com/repos/rails/rails/assignees{/user}",
  "branches_url"=>"https://api.github.com/repos/rails/rails/branches{/branch}",
  "tags_url"=>"https://api.github.com/repos/rails/rails/tags",
  "blobs_url"=>"https://api.github.com/repos/rails/rails/git/blobs{/sha}",
  "git_tags_url"=>"https://api.github.com/repos/rails/rails/git/tags{/sha}",
  "git_refs_url"=>"https://api.github.com/repos/rails/rails/git/refs{/sha}",
  "trees_url"=>"https://api.github.com/repos/rails/rails/git/trees{/sha}",
  "statuses_url"=>"https://api.github.com/repos/rails/rails/statuses/{sha}",
  "languages_url"=>"https://api.github.com/repos/rails/rails/languages",
  "stargazers_url"=>"https://api.github.com/repos/rails/rails/stargazers",
  "contributors_url"=>"https://api.github.com/repos/rails/rails/contributors",
  "subscribers_url"=>"https://api.github.com/repos/rails/rails/subscribers",
  "subscription_url"=>"https://api.github.com/repos/rails/rails/subscription",
  "commits_url"=>"https://api.github.com/repos/rails/rails/commits{/sha}",
  "git_commits_url"=>"https://api.github.com/repos/rails/rails/git/commits{/sha}",
  "comments_url"=>"https://api.github.com/repos/rails/rails/comments{/number}",
  "issue_comment_url"=>"https://api.github.com/repos/rails/rails/issues/comments{/number}",
  "contents_url"=>"https://api.github.com/repos/rails/rails/contents/{+path}",
  "compare_url"=>"https://api.github.com/repos/rails/rails/compare/{base}...{head}",
  "merges_url"=>"https://api.github.com/repos/rails/rails/merges",
  "archive_url"=>"https://api.github.com/repos/rails/rails/{archive_format}{/ref}",
  "downloads_url"=>"https://api.github.com/repos/rails/rails/downloads",
  "issues_url"=>"https://api.github.com/repos/rails/rails/issues{/number}",
  "pulls_url"=>"https://api.github.com/repos/rails/rails/pulls{/number}",
  "milestones_url"=>"https://api.github.com/repos/rails/rails/milestones{/number}",
  "notifications_url"=>"https://api.github.com/repos/rails/rails/notifications{?since,all,participating}",
  "labels_url"=>"https://api.github.com/repos/rails/rails/labels{/name}",
  "releases_url"=>"https://api.github.com/repos/rails/rails/releases{/id}",
  "deployments_url"=>"https://api.github.com/repos/rails/rails/deployments",
  "created_at"=>"2008-04-11T02:19:47Z",
  "updated_at"=>"2018-03-01T18:46:29Z",
  "pushed_at"=>"2018-03-01T18:51:59Z",
  "git_url"=>"git://github.com/rails/rails.git",
  "ssh_url"=>"git@github.com:rails/rails.git",
  "clone_url"=>"https://github.com/rails/rails.git",
  "svn_url"=>"https://github.com/rails/rails",
  "homepage"=>"http://rubyonrails.org",
  "size"=>159714,
  "stargazers_count"=>38811,
  "watchers_count"=>38811,
  "language"=>"Ruby",
  "has_issues"=>true,
  "has_projects"=>true,
  "has_downloads"=>true,
  "has_wiki"=>false,
  "has_pages"=>false, 
  "forks_count"=>15698,
  "mirror_url"=>nil,
  "archived"=>false,
  "open_issues_count"=>1063,
  "license"=> { "key"=>"mit", "name"=>"MIT License", "spdx_id"=>"MIT", "url"=>"https://api.github.com/licenses/mit" },
  "forks"=>15698,
  "open_issues"=>1063,
  "watchers"=>38811,
  "default_branch"=>"master",
  "organization"=> { 
    "login"=>"rails",
    "id"=>4223,
    "avatar_url"=>"https://avatars1.githubusercontent.com/u/4223?v=4",
    "gravatar_id"=>"",
    "url"=>"https://api.github.com/users/rails",
    "html_url"=>"https://github.com/rails",
    "followers_url"=>"https://api.github.com/users/rails/followers",
    "following_url"=>"https://api.github.com/users/rails/following{/other_user}",
    "gists_url"=>"https://api.github.com/users/rails/gists{/gist_id}",
    "starred_url"=>"https://api.github.com/users/rails/starred{/owner}{/repo}",
    "subscriptions_url"=>"https://api.github.com/users/rails/subscriptions",
    "organizations_url"=>"https://api.github.com/users/rails/orgs",
    "repos_url"=>"https://api.github.com/users/rails/repos",
    "events_url"=>"https://api.github.com/users/rails/events{/privacy}",
    "received_events_url"=>"https://api.github.com/users/rails/received_events",
    "type"=>"Organization",
    "open_issues_count"=>1063,
    "license"=> {
      "key"=>"mit", "name"=>"MIT License", "spdx_id"=>"MIT", "url"=>"https://api.github.com/licenses/mit"
    },
    "forks"=>15698,
    "open_issues"=>1063,
    "watchers"=>38811,
    "default_branch"=>"master",
    "organization"=> {
      "login"=>"rails",
      "id"=>4223,
      "avatar_url"=>"https://avatars1.githubusercontent.com/u/4223?v=4",
      "gravatar_id"=>"",
      "url"=>"https://api.github.com/users/rails",
      "html_url"=>"https://github.com/rails",
      "followers_url"=>"https://api.github.com/users/rails/followers",
      "following_url"=>"https://api.github.com/users/rails/following{/other_user}",
      "gists_url"=>"https://api.github.com/users/rails/gists{/gist_id}",
      "starred_url"=>"https://api.github.com/users/rails/starred{/owner}{/repo}",
      "subscriptions_url"=>"https://api.github.com/users/rails/subscriptions",
      "organizations_url"=>"https://api.github.com/users/rails/orgs",
      "repos_url"=>"https://api.github.com/users/rails/repos",
      "events_url"=>"https://api.github.com/users/rails/events{/privacy}",
      "received_events_url"=>"https://api.github.com/users/rails/received_events",
      "type"=>"Organization",
      "site_admin"=>false
    },
    "network_count"=>15698,
    "subscribers_count"=>2613
  }
}
  
end