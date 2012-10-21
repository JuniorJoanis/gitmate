class Mate
  include Gmap
  attr_accessor :avatar_url, :location, :address, :name, :latitude, :longitude
  def initialize (name)
    u = Mate.find name
    return if u.nil?
    @avatar_url = u["avatar_url"]
    @location = u["location"]
    @address = u["location"]

    geolocate = geocode (u["location"].to_s)
    @latitude = geolocate["lat"] if geolocate
    @longitude = geolocate["lng"] if geolocate
    @name =  name
  end

  def self.in_repo username, repository_name
   # Rails.cache.fetch("repo_#{username}_#{repository_name}", :expires_in => 2.hour) do
      commits = Github.repos.commits.all username, repository_name
      authors = commits.map{ |c| c.committer.login if c.committer.login}.uniq
      users = []
      authors.each do |author|
         u = Mate.new(author)
         users.push(u.to_gmap) if u.is_located?
      end
      users
   # end
  end
  
  def self.find author
    Rails.cache.fetch("mate_#{author}", :expires_in => 6.hour) do
      Github.users.find user: author
    end
  end
  
  def is_located?
    !(self.latitude.nil? || self.latitude.nil? ||  self.latitude.blank? || self.longitude.blank?)
  end
  
  def to_gmap
    { "lat" => "#{self.latitude}", "lng"  => "#{self.longitude}", "title" => "Mate", "description" => "I'm a cool mate based in #{self.location}" }
  end
  
end
