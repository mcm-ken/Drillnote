class ProjectController < ApplicationController

before_action :authenticate_user!

  def index
    @project = current_user.projects
  end

  def new
    @project = Project.new
    @instrument = Instrument.all
  end

  def create
  end

end