Rails.application.config.middleware.use OmniAuth::Builder do
    # provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
    provider :github, 'e34d8260405f64d20dc1', 'cefe52df15831f2eb8e8a12346c633bc4885847d'
end