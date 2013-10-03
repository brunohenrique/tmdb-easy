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
movie = Tmdb::Movie.find 550
# => #<TmdbEasy::Movie @attributes=...>

movie.title
# => 'Fight Club'
```

### Testing

```bash
rspec spec
```
