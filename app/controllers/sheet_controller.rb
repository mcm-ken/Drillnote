class SheetController < ApplicationController
   def show
    project = Sheet.where("project_id = #{params[:project_id]}")
    array = []
     project.each do |sheet|
      array << sheet.number
     end
     array.uniq!
     array.sort!
    @member = Sheet.where("project_id = #{params[:project_id]}")
    @sheet = array
    @project = Project.find(params[:project_id])
    @project_sheet = Sheet.where("project_id = #{params[:project_id]}")

   end

   def print
    @project = Project.find(params[:project_id])
    @project_sheet = Sheet.where("project_id = #{params[:project_id]}")
   end


    def index
     @project = Project.find(params[:project_id])
     @project_sheet = Sheet.where("project_id = #{params[:project_id]}")

     #js.saisei用の変数

     sheet = Sheet.where("project_id = #{params[:project_id]}")
     sheets_number = []
     sheets_member = []

     sheet.each do |sheets|
      sheets_number << sheets.number
      sheets_member << sheets.member
     end

     sheets_number.sort!
     sheets_number.uniq!
     sheets_member.uniq!
     sheets_number.delete_at(0)
     gon.sheets_number = sheets_number
     gon.sheets_member = sheets_member

    end

    def new
     @project = Project.find(params[:project_id])
     @project_sheet = Sheet.where("project_id = #{params[:project_id]}")
     @sheets = Sheet.all
     @members = Member.where("project_id = #{params[:project_id]}")
    end

    def create
    sheet = params[:sheet].permit(:x, :y, :member, :number, :project_id, :dots)
    Sheet.create(sheet)
    end

    def edit
      @project = Project.find(params[:project_id])
      @project_sheet = Sheet.where("project_id = #{params[:project_id]}")
      @sheet = Sheet.where("number = #{params[:id]}, project_id = #{params[:project_id]}")
      @sheet_number = params[:id].to_i
      sheet = Sheet.find_by(project_id: params[:project_id], number: params[:id])
      @sheet_dot = sheet.dots
    end

    def update
      sheet_params = params[:sheet].permit(:x, :y, :member, :project_id, :number, :dots)
      sheet = Sheet.find(params[:id])
      sheet.update(sheet_params)
    end

    def destroy
      sheet = Sheet.find(params[:id])
      sheet.destroy
    end


   def all
    @id = params[:project_id]
    sheet = Sheet.where("project_id = #{params[:project_id]}")
    sheet.each do |sheets|
      param = sheets.number.to_i
      id = params[:id].to_i
     if param == id then
      sheets.destroy
     elsif param > id then
      number = param - 1
      sheets.update(number: number)
     end
    end
   end
end