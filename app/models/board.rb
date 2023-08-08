class Board < ApplicationRecord
  attr_accessor :width, :height, :mines_count

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true, length: { maximum: 100 }

  serialize :cells, Array

  scope :search_by_name, -> (query) { where('name LIKE ?', "%#{ query }%") }
end
