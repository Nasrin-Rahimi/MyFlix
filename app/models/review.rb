class Review < ApplicationRecord
  belongs_to :user
  belongs_to :video

  validates :rating, inclusion: { in: 1..5, message: " should be a number between 1 to 5" }

  def video_name
    self.video.title if self.present? && self.video.present?
  end

  # def user_name
  #   self.user.name
  # end

end
