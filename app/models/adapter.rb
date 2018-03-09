class Adapter
 SHOWS = []
 PEOPLE = []
  def self.shows_call
    page = 0
    url = "http://api.tvmaze.com/shows?page=#{page}"
    api = RestClient.get(url)

    while page < 3
      url = "http://api.tvmaze.com/shows?page=#{page}"
      api = RestClient.get(url)
      sub_array = JSON.parse(api)
      SHOWS << sub_array
      page += 1
    end
  end

  def self.create_shows
    SHOWS.flatten.each do |show|
      Show.create(title: show["name"], description: show["summary"], genres: show["genres"][0], status: show["status"], image: show["image"]["medium"], rating: show["rating"]["average"], ratings: "")
    end
  end

  def self.clear_shows
    SHOWS.clear
  end
  def self.clear_people
    PEOPLE.clear
  end

  def self.people_call
    page = 105
    url = "http://api.tvmaze.com/people/#{page}"
    api = RestClient.get(url)
    while page < 180
      url = "http://api.tvmaze.com/people/#{page}"
      api = RestClient.get(url)
      person = JSON.parse(api)
      if person["name"] && person["gender"] && person["birthday"] && person["country"]["name"] && person["image"]["medium"]
        PEOPLE << person
      end
      page += 1
    end
    PEOPLE[0..-1].each do |actor|
      Actor.create(name: actor["name"], gender: actor["gender"], dob: actor["birthday"], pob: actor["country"]["name"], image: actor["image"]["medium"], ratings: "")
    end
  end



  def self.create_people
    byebug
    PEOPLE.each do |actor|
      Actor.create(name: actor[:name], gender: actor[:gender], dob: actor[:birthday], pob: actor[:country][:name], image: actor[:image][:medium], ratings: "")
    end
  end

end
