class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, numericality: { greater_than: 0 }
  #validate_presence_of: Rails 3以前寫法

  belongs_to :user
  has_many :comments, -> {order(id: :desc)}

  has_many :likes_products
  has_many :liked_users, through: :likes_products, source: :user

  has_one_attached :cover
  has_one_attached :cover do |f|
    f.variant :cover, resize_to_limit: [800, 800]
    f.variant :cover_sm, resize_to_limit: [500, 500]

  end

  # scope
  # scope :ok, -> {where(deleted_at:nil)}
  default_scope{where(deleted_at:nil)}



  def destroy
    update(deleted_at: Time.current)
  end




end

# https://guides.rubyonrails.org/active_record_validations.html#numericality
