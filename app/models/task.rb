class Task < ActiveRecord::Base
  attr_accessible :content, :hour, :minute
  belongs_to :user

  validates :content, presence: true
  validates :user_id, presence: true
  validates :hour, presence: true
  validates :minute, presence: true

  default_scope order: 'tasks.created_at'
end
