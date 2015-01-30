# == Schema Information
#
# Table name: twitter_reports
#
#  id              :integer          not null, primary key
#  twitter_id      :string
#  screen_name     :string
#  name            :string
#  followers_count :integer
#  friends_count   :integer
#  statuses_count  :integer
#  retweet_count   :integer
#  favorite_count  :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class TwitterReport < ActiveRecord::Base

  def self.compute_for_all_users!
    user_id_or_screen_names = []
    user_id_or_screen_names.each do |user_id_or_screen_name|
      user_data = TwitterService.client.user(user_id_or_screen_name)
      self.compute_for_user!(user_data)
    end
  end

  def self.compute_for_user!(user_data)
    attributes                      = { screen_name: user_data["screen_name"] }
    twitter_report                  = TwitterReport.find_or_initialize_by attributes
    twitter_report.name             = user_data["name"]
    twitter_report.followers_count  = user_data["followers_count"]
    twitter_report.friends_count    = user_data["friends_count"]
    twitter_report.statuses_count   = user_data["statuses_count"]
    twitter_report.retweet_count    = user_data["retweet_count"]
    twitter_report.favorite_count   = user_data["favorite_count"]
    twitter_report.save!
  end
end
