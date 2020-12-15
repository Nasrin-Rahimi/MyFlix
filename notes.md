User
    belongs_to :plan
    has_many :invitations
    has_many :payments
    has_many :reviews
    has_many :videos, through: :reviews 

Video
    has_and_belongs_to_many :genres
    has_many :reviews
    has_many :users, through: :reviews

Review
    belongs_to :user
    belongs_to :video

Genre
    has_and_belongs_to_many :videos

Invitation
    belongs_to :user

Payment
    belongs_to :user

Plan
    has_many :users
    title :string
    description :text
    price :float

<!-- Terms-of-Use : All plans offer unlimited TV shows and movies, on as many devices as you want. HD (720p), Full HD (1080p), Ultra HD (4K) and HDR availability subject to your Internet service and device capabilities. Not all content available in HD, Full HD, Ultra HD, or HDR. -->