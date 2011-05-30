class Comment < ActiveRecord::Base
  belongs_to :user
  validates :text, :length => {:minimum => 4}
  COUNT = 5
  scope :recent, lambda{|count| order('created_at DESC').limit(count) }

  def to_s
    "#{self.user.address.city},#{self.user.address.country}"
  end
end

