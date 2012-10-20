class Mate
  attr_accessor :avatar_url, :location, :name
  
  def self.in_repo username, repository_name
    commits = Github.repos.commits.all username, repository_name
    authors = commits.map{ |c| c.committer.login if c.committer.login}.uniq
    users = []
    authors.each do |author|
       u = Github.users.find user: author
       users.push({:name => author.to_s, :location => u["location"], :avatar_url => u["avatar_url"]})
    end
    users
  end
  
  def self.find author
    Github.users.find user: author
  end
end
