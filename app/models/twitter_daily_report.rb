# == Schema Information
#
# Table name: twitter_daily_reports
#
#  id          :integer          not null, primary key
#  twitter_id  :string
#  screen_name :string
#  name        :string
#  followers   :integer          default("0")
#  friends     :integer          default("0")
#  statuses    :integer          default("0")
#  favourites  :integer          default("0")
#  values      :integer          default("0")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  date_time   :datetime
#

class TwitterDailyReport < ActiveRecord::Base

  def update_user_data(user_data)
    self.screen_name  = user_data["screen_name"]
    self.name         = user_data["name"]
    self.followers    = compute_cumulative_moving_average(followers, user_data["followers_count"])
    self.friends      = compute_cumulative_moving_average(friends, user_data["friends_count"])
    self.statuses     = compute_cumulative_moving_average(statuses, user_data["statuses_count"])
    self.favourites   = compute_cumulative_moving_average(favourites, user_data["favourites_count"])
    self.values       = values + 1
  end

  def compute_cumulative_moving_average(current_cma, new_value)
    current_cma + ((new_value - current_cma) / (values + 1))
  end
end
