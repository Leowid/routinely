class Task < ActiveRecord::Base
  attr_accessible :content, :hour, :to_hour
  belongs_to :user
  NULL_ATTRS = %w( to_hour )
  before_save :nil_if_blank


  validates :content, presence: true
  validates :user_id, presence: true
  validates :hour, presence: true

  default_scope order: 'tasks.created_at'

   protected

  def nil_if_blank
    NULL_ATTRS.each { |attr| self[attr] = nil if self[attr].blank? }
  end
end
