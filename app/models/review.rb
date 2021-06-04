class Review < ApplicationRecord
  belongs_to :user
  belongs_to :video

  validates :rating, inclusion: { in: 1..5, message: " should be a number between 1 to 5" }

  scope :by_video, ->(video_id) {where("video_id == ?", video_id) }
  

  def video_name
    self.video.title if self.present? 
  end

  def user_name
    self.user.name if self.present? 
  end

end
