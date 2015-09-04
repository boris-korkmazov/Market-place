class Comment < ActiveRecord::Base

  belongs_to :lesson

  validates :name, :body, presence: true

end
