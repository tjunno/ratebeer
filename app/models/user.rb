class User < ActiveRecord::Base
  include RatingAverage
  has_secure_password
  validates :password, :length => { :minimum => 4}
  validates :password, length: { minimum: 4 }, format: {with: /\A[A-Z]+\z/}
  #validates :password, :format => {:with => /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,}$/}
  has_many :ratings, dependent: :destroy
  has_many :beers, through: :ratings
  has_many :memberships
  has_many :beer_clubs, :through => :memberships

  validates :username, uniqueness: true,
                       length: { minimum: 3, maximum: 15 }

end
