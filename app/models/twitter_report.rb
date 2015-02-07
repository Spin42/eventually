# == Schema Information
#
# Table name: twitter_reports
#
#  id               :integer          not null, primary key
#  twitter_id       :string
#  screen_name      :string
#  name             :string
#  followers_count  :integer
#  friends_count    :integer
#  statuses_count   :integer
#  favourites_count :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class TwitterReport < ActiveRecord::Base

  def update_user_data(user_data)
    self.screen_name  = user_data["screen_name"]
    self.name         = user_data["name"]
    self.followers    = user_data["followers_count"]
    self.friends      = user_data["friends_count"]
    self.statuses     = user_data["statuses_count"]
    self.favourites   = user_data["favourites_count"]
  end

end
