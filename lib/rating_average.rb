module RatingAverage

  def average_rating
    unless ratings.empty?
      ratings.average('score').round 1
    end
  end
end