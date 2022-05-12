class Shop < ApplicationRecord
  belongs_to :user
  has_many :shop_tags
  has_many :tags, through: :shop_tags
  has_many :comments, dependent: :destroy

  attachment :image
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :shop_hp, presence: true
  validates :address, presence: true
  validates :telephone, presence: true
  validates :image, presence: true

  geocoded_by :address, latitude: :lat, longitude: :lon
  after_validation :geocode

  def save_tags(tags)
    tag_list = tags.delete(" ").split(',')
    current_tags = self.tags.from_x_second_ago(5.second).pluck(:name)
    old_tags = current_tags - tag_list
    new_tags = tag_list - current_tags

    p current_tags
    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
    end
  end
end
