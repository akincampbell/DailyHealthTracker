# == Schema Information
#
# Table name: health_checkins
#
#  id         :integer          not null, primary key
#  exercise   :boolean
#  fruit      :boolean
#  grain      :boolean
#  journal    :string
#  protein    :boolean
#  vegetable  :boolean
#  water      :boolean
#  weight     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class HealthCheckin < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
end
