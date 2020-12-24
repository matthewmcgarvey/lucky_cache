# lucky_cache

Provides caching for Lucky app and particularly for html caching.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     lucky_cache:
       github: matthewmcgarvey/lucky_cache
   ```

2. Run `shards install`
3. Create a `config/cache.cr` and add:

```crystal
LuckyCache.configure do |settings|
  settings.cache = Cache::MemoryStore(String, String).new(expires_in: 30.minutes)
end

module Lucky::HTMLBuilder
  include LuckyCache::HtmlHelpers
end
```

## Usage

```crystal
require "lucky_cache"
```

```crystal
cache("key") do
  para "hello, world"
end
```

## TODO

- Use `Avram::Model` and queries as keys

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/matthewmcgarvey/lucky_cache/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Matthew McGarvey](https://github.com/matthewmcgarvey) - creator and maintainer
