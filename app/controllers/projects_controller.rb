class ProjectsController < ApplicationController

  def index
    @user = current_user
    @showlogin = false
    if params[:logout]
      @showlogin = true
    end

    @projects = Project.order(id: :asc)
    repos = Github.new
    @repo_list = repos.get_projects()
    @complete_list = false
    if params[:complete_list]
      @complete_list = true
    end
    if params[:starred_list]
      @complete_list = false
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Saved"
      redirect_to projects_path
    else
      flash[:notice] = "Please fill everything in"
      render :new
    end
  end

  def edit
   @project = Project.new
   @project = Project.find(params[:id])
   @user = current_user
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = "Project updated!"
      redirect_to projects_path
    else
      render :edit, notice: 'There was an error updating your project. Please try again.'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "Deleted"
    redirect_to projects_path
  end

  private
    def project_params
      params.require(:project).permit(:title, :description, :languages, :link, :image)
    end
end
