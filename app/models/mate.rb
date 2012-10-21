class Mate
  attr_accessor :avatar_url, :location, :address, :name, :latitude, :longitude
  
  def initialize (name)
    u = Github.users.find user: name
    @avatar_url = u["avatar_url"]
    @location = u["location"]
    @address = u["location"]
    @name =  name
  end

  def self.in_repo username, repository_name
    Rails.cache.fetch("repo_#{username}_#{repository_name}", :expires_in => 2.hour) do
      commits = Github.repos.commits.all username, repository_name
      authors = commits.map{ |c| c.committer.login if c.committer.login}.uniq
      users = []
      authors.each do |author|
         users.push(Mate.new(author))
      end
      users
    end
  end
  
  def self.find author
    Rails.cache.fetch("mate_#{author}", :expires_in => 6.hour) do
      Github.users.find user: author
    end
  end
  
end
