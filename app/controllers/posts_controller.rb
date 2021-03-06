class PostsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @post = @group.posts.new
  end

  def edit
    @group = Group.find(params[:group_id])
    @post = @group.posts.find(params[:id])
  end

  def create
    @group = Group.find(params[:group_id])
    @post = @group.posts.build(post_params)
    if @post.save
      redirect_to group_path(@group), notice: "添加文章成功"
    else
      render :new
    end

  end

  def update
    @group = Group.find(params[:group_id])
    @post = @group.posts.find(params[:id])

    if @post.udpate(post_params)
      redirect_to group_path(@group), notice: "更新文章成功"
    else
      render :edits
  end

  def destory
    @group = Group.find(params[:group_id])
    @post = @group.posts.find(params[:id])
    @post.destroy
    redirect_to group_path(@group) , alert: "文章删除成功"   
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end


end
