class Brewery < ActiveRecord::Base
  include RatingAverage

  has_many :beers, :dependent => :destroy
  has_many :ratings, :through => :beers

  validates :name, presence: true
  validates :year, numericality: { greater_than_or_equal_to: lambda { |x| Time.now.year },
                                   less_than_or_equal_to: 2014,
                                   only_integer: true }



  #def average_rating
  #  ratings.sum(:score) / ratings.size
  #end

  def to_s
    "#{name}"
  end
end
