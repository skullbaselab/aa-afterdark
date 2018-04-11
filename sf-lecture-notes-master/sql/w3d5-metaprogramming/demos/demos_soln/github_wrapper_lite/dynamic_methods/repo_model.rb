require_relative 'git_wrapper.rb'
require 'byebug'
class RepoModel
  def initialize(user = 'rails', repo_name = 'rails')
    ####################################
    ######### Hit GitHub API ###########
    ####################################
    # @wrapper = GitWrapper.new(user, repo_name)

    ####################################
    ### Use Static Hardcoded values #####
    ####################################    
    @wrapper = GitWrapper.new
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
  # Dynamic Proxy usage !
  # NOTE: For the curious ones, we are purposefully
  # omitting the implementation of respond_to_missing? 
  def method_missing(name, *args)
    @wrapper.send name
  end
  


end