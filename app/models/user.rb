class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum:3, maximum:20}, confirmation: true
  before_create :encrypt_password
  has_many :products
  has_many :comments
  # before_save :encrypt_password
  #after_save :send_text

  has_many :likes_products
  has_many :liked_products, through: :likes_products, source: :product

  def self.login(data)
    email = data[:email]
    password = Digest::SHA256.hexdigest("*xx#{data[:password]}yy-")

    find_by(email: , password: )
  end

  def own?(p)
    product_ids.include?(p.id)
  end

  def liked?(p)
    liked_product_ids.include?(p.id)
  end

  private

  #設定加密，為了不想讓人看到密碼長怎麼，不管是系統管理員or駭客
  #在存擋前面，本身這個物件的password，利用Digest::SHA.hexdigest把密碼變成奇怪的樣子
  def encrypt_password
    salted_password = hashed_password = "*xx#{self.password}yy-"
    self.password = Digest::SHA256.hexdigest(salted_password)
  end
end
