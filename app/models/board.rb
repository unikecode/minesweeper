# app/models/board.rb
class Board < ApplicationRecord
  attr_accessor :width, :height, :mines_count

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, uniqueness: true
  validates :name, presence: true, length: { maximum: 100 }

  serialize :cells, Array
end
