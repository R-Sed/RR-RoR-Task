class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :title, length: { minimum: 1}
  validates :text, length: { minimum: 1}
end
