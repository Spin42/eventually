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

  def self.compute_for_all_users!
    Event::TWITTER_USERS.each do |user_id_or_screen_name|
      event = Event.where("name = ?", "twitter user")
                .where("data->>'screen_name' = ? OR data->>'id_str' = ?", user_id_or_screen_name, user_id_or_screen_name)
                .order(created_at: :desc).first
      self.compute_for_user!(event.data)
    end
  end

  def self.compute_for_user!(user_data)
    twitter_report                  = TwitterReport.new
    twitter_report.twitter_id       = user_data["id"]
    twitter_report.screen_name      = user_data["screen_name"]
    twitter_report.name             = user_data["name"]
    twitter_report.followers_count  = user_data["followers_count"]
    twitter_report.friends_count    = user_data["friends_count"]
    twitter_report.statuses_count   = user_data["statuses_count"]
    twitter_report.favourites_count = user_data["favourites_count"]
    twitter_report.save!
  end
end
