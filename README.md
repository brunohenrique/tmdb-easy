## TMDB Easy

Simple wrapper for TMDB API.

### Installing

Put in your Gemfile:

```ruby
gem 'tmdb-easy', github: 'brunohenrique/tmdb-easy'
```

### Using

#### Configure

Specify the API Key (to get one just do a TMDB account):

```ruby
TmdbEasy::Base.api_key 'my_apy_key'
```

#### Movie

```ruby
## Get a movie by TMDB id
movie = TmdbEasy::Movie.find 550
# => #<TmdbEasy::Movie @attributes=...>

movie.title
# => 'Fight Club'

## Search movie by terms returning full movie objects
movies = TmdbEasy::Movie.search 'fight club'
movies.map(&:title)
# => ['Fight Club', 'Jurassic Fight Club', ...]
```

#### Search

```ruby
# TmdbEasy::Search.fetch terms, resource_type [movie, keyword*, person*, etc*]
search = TmdbEasy::Search.fetch 'fight club', 'movie'
search.results
# => [{"adult"=>false, "backdrop_path"=>"/8uO0gUM8aNqYLs1OsTBQiXu0fEv.jpg", "id"=>550, "original_title"=>"Fight Club", "release_date"=>"1999-10-14", "poster_path"=>"/2lECpi35Hnbpa4y46JX0aY3AWTy.jpg", "popularity"=>13.6327066209895, "title"=>"Fight Club", "vote_average"=>7.5, "vote_count"=>2614},
#     {"adult"=>false, "backdrop_path"=>nil, "id"=>151912, "original_title"=>"Jurassic Fight Club", "release_date"=>"", "poster_path"=>nil, "popularity"=>0.46, "title"=>"Jurassic Fight Club", "vote_average"=>0.0, "vote_count"=>0}, ...]
```

### Contributing

#### Developing

#### Testing

```bash
rspec
```

------------------------------------------------------------------------------
<b>*</b>Not implemented yet
