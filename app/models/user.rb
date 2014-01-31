class User < ActiveRecord::Base
  include RatingAverage
  has_secure_password
  validates :password, :length => { :minimum => 4}
  #validates :password, length: { minimum: 4 }, format: {with: /\A[A-Z]+\z/}
  has_many :ratings   # käyttäjällä on monta ratingia
  has_many :beers, through: :ratings
  has_many :memberships
  has_many :beer_clubs, :through => :memberships

  validates :username, uniqueness: true,
                       length: { minimum: 3, maximum: 15 }

end
