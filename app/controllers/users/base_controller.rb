module Users
  class BaseController < ApplicationController
    before_action :authenticate_user!, :authorize_resource!
  end
end
