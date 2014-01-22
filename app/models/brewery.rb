class Brewery < ActiveRecord::Base
  has_many :beers, :dependent => :destroy
  has_many :ratings, :through => :beers

  def average_rating
    ratings.sum(:score) / ratings.size
  end

  def to_s
    "#{name}"
  end
end
