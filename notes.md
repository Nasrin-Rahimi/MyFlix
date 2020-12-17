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
    -+++++check if name or password is blank or incorrect in login page and return appropriate message.

Login from GitHub
    -Add gems
    -create OAuth Application in GitHub account
    -create a file omniauth.rb in config/initializers
    -Copy Client ID and Client Secret from GitHub and put them in omniauth.rb
    -Add route for it.
    -Add a link to login page for login via Github.
    -change create action in session controller

**blog subjects
    about form_with and local: true
    about logged_in user
    belongs_to :plan, optional: true
<!-- Terms-of-Use : All plans offer unlimited TV shows and movies, on as many devices as you want. HD (720p), Full HD (1080p), Ultra HD (4K) and HDR availability subject to your Internet service and device capabilities. Not all content available in HD, Full HD, Ultra HD, or HDR. -->