require "json"
require "open-uri"

url = "https://tmdb.lewagon.com/movie/top_rated"
html_doc = URI.open(url).read
movies = JSON.parse(html_doc)["results"]

movies.each do |movie|
  Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
    rating: movie['vote_average']
  )
end