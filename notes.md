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

generate models and Migrations

rails g model user name password_digest email phone_number:integer plan:references
rails g model plan title description price:float

rails generate migration CreateJoinTableGenreVideo genre video

Signup user 
    -routes: user new, create
    _controller: user new, create
    _view: user new
    _validations: user model
    _show error messages
        error div doesn't work on password

Login user
    -routes: session new create destroy
    -controller: session new create destroy (rails g controller sessions new --no-test-framework)
    -view: session new
    
Login from GitHub
    -Add gems
    -create OAuth Application in GitHub account
    -create a file omniauth.rb in config/initializers
    -Copy Client ID and Client Secret from GitHub and put them in omniauth.rb
    -Add route for it.
    -Add a link to login page for login via Github.
    -change create action in session controller.

Genres:
    create genres routes
    create controller
    Crud genre
    genre validation

videos:
    - create video
        select genres from checkbox list- add new genres
    - show video
        see the video's genres
    - update video
        select genres from checkbox list
    -delete video

include_hidden: false used in video/_form for removing empty element from genre_ids array.
reject_if: :all_blank used in accepts_nested_attributes_for :genres in video model for doesn't check validation if new genre doesn't fill.

Reviews:
    -add nested route videos/reviews
    -reviews controller
    -show reviews for a particular video.
    -write a review for a video.
    -Edit review.
    -delete review

Users: 
    -Show page has edit link
    -update user
    
Add admin 
    rails g migration AddAdminToUsers admin:boolean
    - Sign up as admin
    -login as admin and see the admin menu.
    -add admin authorizastion before required actions.
    -add scope admin and add a route for management controller.
    -add admin dir in controllers.

++Remove video_url from video table
++ change password
++Check session helper
++change video linkin menu to see vieo by release year or by genres.
++select image url for new or edit video

++ My List()
    Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)


**blog subjects
    about form_with and local: true
    about logged_in user
    belongs_to :plan, optional: true
    about Choosing Between has_many :through and has_and_belongs_to_many
    about Creating Join Tables for has_and_belongs_to_many Associations.Active Record creates the name by using the lexical order of the class names. And join table should created without a primary key
    Association Callbacks
<!-- Terms-of-Use : All plans offer unlimited TV shows and movies, on as many devices as you want. HD (720p), Full HD (1080p), Ultra HD (4K) and HDR availability subject to your Internet service and device capabilities. Not all content available in HD, Full HD, Ultra HD, or HDR. -->