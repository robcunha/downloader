class TwitterService
  def self.get_data(url)
    id = url.split('/')[-1]
    final_url = "https://api.twitter.com/1.1/statuses/show.json?id=#{id}&include_entities=true&tweet_mode=extended"
    html = HTTParty.get(
      final_url,
      headers: {
        'Authorization': 'Bearer AAAAAAAAAAAAAAAAAAAAAMwHTQEAAAAA0VLKmz5mDc67O2Z6gUB60R1rCV0%3DTnandpKNhqbk2SZ9F2SkSrQkGslVa997fq33RydGGoLzBxUMqC'
      }
    )
    # binding.pry
    return html['extended_entities']['media'][0]['video_info']['variants'][-1]['url']
  end
end