class MemberController < ApplicationController

  def create
    member = params[:member].permit(:name, :project_id)
    Member.create(member)
  end

  def destroy
    member = params[:member_delete].permit(:name, :project_id)
    member_id = Member.find_by(project_id: params[:member_delete][:project_id], name: params[:member_delete][:name])
    member_id.destroy
        #シートも削除！
  end

  def index
  end
end
