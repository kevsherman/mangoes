class Movie < ActiveRecord::Base


  validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }
  validates :description, presence: true
  validates :release_date, presence: true

  validate :release_date_is_in_the_future

  has_many :reviews

  mount_uploader :poster, PosterUploader

  def review_average
    if reviews.size == 0
      "X"
    else
      reviews.sum(:rating_out_of_ten)/reviews.size
    end
  end

  protected

  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, "should probably be in the future") if release_date < Date.today
    end
  end

end