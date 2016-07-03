class ProjectController < ApplicationController

before_action :authenticate_user!

  def index
    @project = current_user.projects
  end

  def new
    @project = Project.new
  end

  def top
  end

  def create
    Project.create(name:project_params[:name], member: project_params[:member], user_id: current_user.id)
  end

  def destroy
    project_X = Project.find(params[:id])
     if current_user.id == project_X.user_id
        project_X.destroy
      end
  end

private
  def project_params
    params.permit(:name,:member)
  end
end
