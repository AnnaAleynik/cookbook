module Users
  class BaseController < ApplicationController
    before_action :authenticate_user!

    verify_authorized
  end
end
