class Shop < ApplicationRecord
  belongs_to :user
  has_many :shop_tags
  has_many :tags, through: :shop_tags
  has_many :comments, dependent: :destroy

  attachment :image

  validates :name, presence: true, length: { minimum: 1 }
  validates :introduction, presence: true, length: { minimum: 5 }
  VALID_HP_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :shop_hp, presence: true, format: { with: VALID_HP_REGEX }
  validates :address, presence: true, length: { minimum: 10 }
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :telephone, presence: true, format: { with: VALID_PHONE_REGEX }
  validates :image, presence: true
  validates :tag, acceptance: true

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
