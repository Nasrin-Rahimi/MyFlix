class Review < ApplicationRecord
  belongs_to :user
  belongs_to :video

  validates :rating, inclusion: { in: 1..5, message: " should be a number between 1 to 5" }

  scope :by_video, ->(video_id) {where("video_id == ?", video_id) }
  

  def video_name
    self.video.title if self.present? && self.video.present?
  end

  # def self.find_by_video(video_id)
  #   Review.where(video_id: video_id)
  # end

end
