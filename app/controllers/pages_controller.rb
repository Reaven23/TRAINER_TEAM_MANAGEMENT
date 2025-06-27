class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @teams = Team.all
  end
end
