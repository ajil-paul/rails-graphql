class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  def truncated_preview
    description.truncate(100)
  end
end
