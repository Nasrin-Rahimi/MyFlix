class Video < ApplicationRecord
    has_and_belongs_to_many :genres
    has_many :reviews
    has_many :users, through: :reviews
    accepts_nested_attributes_for :genres, reject_if: :all_blank

    # def genres_attributes=(genres_attributes)
    #     genres_attributes.each do |genre_attributes|
    #         if genre_attributes[1][:title] == ""
    #             genres_attributes.delete(genre_attributes[0])
    #         end  
    #     end
    #     genres_attributes  
    # end

    validates :title, presence: true
    validates :title, uniqueness: true
end
