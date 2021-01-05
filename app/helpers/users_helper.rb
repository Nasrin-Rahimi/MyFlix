module UsersHelper
    def users_count
        User.count
    end

    def true_false_to_yes_no(admin)
        admin == true ? 'Yes' : 'No'
    end

end
