class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :report
  has_many :likes
end
