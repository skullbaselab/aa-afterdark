require_relative 'git_wrapper.rb'
require 'byebug'
class RepoModel
  def initialize(owner = 'rails', repo_name = 'rails')
    ####################################
    ######### Hit GitHub API ###########
    ####################################
    # @data_source = GitWrapper.repo_meta(owner, repo_name)

    ####################################
    ### Use Static Hardcoded values ####
    ####################################        
    @data_source = GitWrapper.repo_meta
  end
  
  # def forks
  #   @data_source['forks']
  # end
  
  # def private
  #   @data_source['private']
  # end
  
  # def stargazers
  #   @data_source['stargazers_count']
  # end

  # Overriding BasicObject#methd_missing
  # Ghost Methods 👻 !
  def method_missing(name, *args)
    @data_source[name.to_s]
  end

end