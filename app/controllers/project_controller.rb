class ProjectController < ApplicationController

before_action :authenticate_user!,  only: [:index, :show, :new, :create, :edit, :update, :destroy, :setting]
  def email
  end
  def top
  end
  def how
  end
  def new
  end

  def index
    @project = current_user.projects
  end

  def create
    Project.create(name: params_create[:name], user_id: current_user.id)
  end

  def destroy
    project_X = Project.find(params[:id])
     if current_user.id == project_X.user_id
        project_X.destroy

        Sheet.destroy_all(project_id: "#{params[:id]}")
        Member.destroy_all(project_id: "#{params[:id]}")
        #シートも削除！
      end
  end

  def setting
    @project = Project.find(params[:id])
    @member = Member.where("project_id = #{params[:id]}")
  end

  def update
    project = Project.find(params[:id])
    project.update(name: params_create[:name], user_id: current_user.id)
  end

private
 def params_create
  params.permit(:name)
 end
end
