# app/models/inquiry.rb
class Inquiry
  include ActiveModel::Model

  attr_accessor :question

  validates :question, presence: true
end
