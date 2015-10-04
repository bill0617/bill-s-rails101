class GroupsController < ApplicationController
before_action :authenticate_user!
 def index
  @groups = Group.all	
 end

 def new
 @group = Group.new
 end

 def show
 @group = Group.find(params[:id])
 @posts = @group.posts
 end

 def edit
 @group = current_user.groups.find(params[:id])
 end

 def create
 @group = current_user.groups.new(group_params)

   if @group.save
   	current_user.join!(@group)
   	redirect_to groups_path, notice: "新增成功唷！"
   else
   	render :new
   end
 end

 def update
 @group = current_user.groups.find(params[:id])
 if @group.update(group_params)
 	redirect_to groups_path, notice: "修改成功唷！"
  else
  	render :edit
  end
 end

 def destroy
 @group = current_user.groups.find(params[:id])
 @group.destroy
 redirect_to groups_path, alert: "刪除不能後悔！"
 end

 def join
 @group = Group.find(params[:id])

 if !current_user.is_member_of?(@group)
 	current_user.join!(@group)
 	flash[:success] = "恭喜加入！"
 else 
 	flash[:warning] = "已經是了！"
 end
 redirect_to group_path(@group)
end

def quit
	@group =Group.find(params[:id])
if current_user.is_member_of?(@group)
current_user.quit!(@group)
flash[:success] = "已經退出！"
else
flash[:notice] = "沒加入怎退出？幹"
end
redirect_to group_path(@group)
end

private
def group_params
params.require(:group).permit(:title, :description)
end
end