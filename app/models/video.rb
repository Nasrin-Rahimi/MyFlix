class Video < ApplicationRecord
    has_and_belongs_to_many :genres
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews

    accepts_nested_attributes_for :genres, reject_if: :all_blank

    validates :released_year, numericality: { only_integer: true }, allow_nil: true, length: { is: 4}
    validates :title, presence: true, uniqueness: true

    scope :new_released, -> {where("released_year >= ?", Time.current.year) }

    def rating_to_stars
        self.reviews.average('rating')
    end
end
