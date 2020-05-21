# this may be not necessary for this case
class ApplicationController < ActionController::Base
  include SessionsHelper
  include AppsHelper
end
