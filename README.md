# activerecord-postgres-dump-schemas

Explicitly define which PostgreSQL schemas to dump in your Rails `db/structure.sql` file when calling `rake db:structure:dump`.

This functionality will be included in Rails 5, but this gem backports this feature to Rails 3 and Rails 4. Credit goes to [@rywall](https://github.com/rywall) for [implementing this feature](https://github.com/rails/rails/pull/19347) for Rails 5.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "activerecord-postgres-dump-schemas"
```

And then execute:

```sh
$ bundle
```

## Usage

This adds a `config.active_record.dump_schemas` option you can define in your `config/application.rb` file. The value of this option can one of the following:

- `:schema_search_path` (default): Dump any schemas listed in your `database.yml`'s `schema_search_path`.
- `:all`: Dump all schemas regardless of the `schema_search_path`.
- A string of comma separated schemas to pass a custom list of schemas.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/GUI/activerecord-postgres-dump-schemas.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
