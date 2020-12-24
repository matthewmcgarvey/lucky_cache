module LuckyCache::HtmlHelpers
  def cache(key, expires_in : Time::Span? = nil)
    cache = LuckyCache.settings.cache
    if cache.nil?
      yield
      return
    end

    cached_html = cache.read(key)
    if cached_html
      raw(cached_html)
    else
      original_view = @view
      # Temporarily override the view
      @view = IO::Memory.new

      check_tag_content! yield # This will write to our temporary @view object

      html_fragment = @view.to_s

      if ex = expires_in
        cache.write(key, html_fragment, expires_in: ex)
      else
        cache.write(key, html_fragment)
      end
      # Set instance var back to original view
      @view = original_view
      # Write fragment to original view
      raw(html_fragment)
    end
  end
end
