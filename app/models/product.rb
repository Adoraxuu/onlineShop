class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, numericality: { greater_than: 0 }
  #validate_presence_of: Rails 3以前寫法

  belongs_to :user
  has_many :comments, -> {order(id: :desc)}

  # scope
  # scope :ok, -> {where(deleted_at:nil)}
  default_scope{where(deleted_at:nil)}



  def destroy
    update(deleted_at: Time.current)
  end




end

# https://guides.rubyonrails.org/active_record_validations.html#numericality
