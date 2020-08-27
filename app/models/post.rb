class Post < ApplicationRecord
  belongs_to :user
  # Active Storage from Rails 5
  has_one_attached :thumbnail
  has_one_attached :banner
  # Action text from Rails 6
  has_rich_text :body

  validates :title, length: {minimum:5, maximum:100}
  validates :body, length: {minimum:25, maximum: 255}

  def optimized_image(image,x,y)
    return image.variant(resize_to_fill: [x,y]).processed
  end
end