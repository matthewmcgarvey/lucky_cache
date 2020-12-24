require "cache"
require "./lucky_cache/*"

module LuckyCache
  VERSION = "0.1.0"

  Habitat.create do
    setting cache : Cache::Store(String, String)?
  end
end
