# Taxa

Taxa allows users to search multiple taxonomic data sources. Currently only Open Tree of Life and EOL classic APIs are implemented.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'taxa'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install taxa

## Usage
```ruby
tol_client = Taxa::OpenTreeOfLife::Client.new
tol_client.tnrs.match_names('Cotyledon') # can be an array or a string

eol_client = Taxa::EOLClassic::Client.new
eol_client.hierarchy_entries(7834469)

powo_client = Taxa::PlantsOfTheWorldOnline::Client.new
powo_client.search('Crassula alata')
powo_client.search('Crassula', ['species_f', 'has_images'])
powo_client.search('family:Crassulaceae', ['species_f', 'has_images'])
```

For Plants of the World Online please see their official python library for available search terms: 
https://github.com/RBGKew/pykew#available-search-terms-1

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ssherman/taxa. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/ssherman/taxa/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Taxa project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ssherman/taxa/blob/master/CODE_OF_CONDUCT.md).
