class TwitterDataWorker < DataWorker

  TWITTER_USERS = [ "Spin_42" ]

  def fetch_data
    event_hashes = []
    TWITTER_USERS.each do |user_id_or_screen_name|
      user_data  = TwitterService.client.user(user_id_or_screen_name)
      event_hash = {
        "source_name" => "spin42-reporting",
        "name"        => "twitter user data",
        "data"        => user_data.attrs,
        "created_at"  => Time.now.utc
      }
      event_hashes.push(event_hash)
    end
    event_hashes
  end
end

