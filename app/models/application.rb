# == Schema Information
#
# Table name: applications
#
#  id         :integer          not null, primary key
#  name       :string
#  api_key    :string
#  api_secret :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Application < ActiveRecord::Base
end
