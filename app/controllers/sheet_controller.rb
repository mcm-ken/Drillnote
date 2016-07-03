class SheetController < ApplicationController

  def index
    project = Project.find(params[:project_id])
    @sheets = project.sheets
  end

end
