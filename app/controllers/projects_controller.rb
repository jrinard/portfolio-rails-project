class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    repos = Github.new
    @repo_list = repos.get_projects()
  end

  def show
    @project = Project.find(params[:id])
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
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = "Updated"
      redirec_to projects_path
    else
      render :edit
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
      params.require(:project).permit(:title, :description, :languages, :link)
    end
end
