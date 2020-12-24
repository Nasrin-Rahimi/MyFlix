class Admin::StatsController < ApplicationController
    before_action :authentication_required, :authorize_admin
end