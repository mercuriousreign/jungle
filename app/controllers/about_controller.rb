class AboutController < ApplicationController
  #set instance variable for view page to fetch information
  def index
    @information = 'This is the about page with about information about the jungle store.'
  end
end
