class Report < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments

  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: { in: 2..100 }
  validates :content, presence: true
  validates :category, presence: true

  def last_update
  date = "#{updated_at.day}/#{updated_at.month}/#{updated_at.year}"
  time = "#{updated_at.hour}:#{updated_at.min}"
  "#{date} - #{time}"
  end
end
