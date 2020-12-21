class Review < ApplicationRecord
  belongs_to :user
  belongs_to :video

  def video_name
    self.video.title
  end

  def user_name
    self.user.name
  end
  
end
