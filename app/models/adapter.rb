class Adapter

  def self.shows_call
    page = 0
    url = "http://api.tvmaze.com/shows?page=#{page}"
    api = RestClient.get(url)
    shows_array = []
    while page < 5
      url = "http://api.tvmaze.com/shows?page=#{page}"
      api = RestClient.get(url)
      sub_array = JSON.parse(api)
      shows_array << sub_array
      page += 1
    end
    shows_array.flatten!.each do |show|
      Show.create(title: )

    end
    binding.pry
  end

  def self.people_call
    page = 1
    url = "http://api.tvmaze.com/people/#{page}"
    api = RestClient.get(url)
    while page < 80
      url = "http://api.tvmaze.com/people/#{page}"
      api = RestClient.get(url)
      person = JSON.parse(api)
      people_array << person
      puts page
      page += 1
    end
    people_array.each do |actor|
      Actor.create(name: actor[:name], gender: actor[:gender], dob: actor[:birthday], pob: actor[:country][:name], image: actor[:image][:medium])
    end
    binding.pry
  end



end
