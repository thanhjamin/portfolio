class ProjectsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      current_user.projects << @project
      flash[:notice] = "Project was successfully added."
      redirect_to @project
    else
    flash[:alert] = "Project could not be saved"
    render :new
    end
  end

  def show
    @project = Project.find(params[:id])
    @remarkable = @project
    @remarks = policy_scope(@project.remarks)
    @remark = Remark.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project  = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
  end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to @project, notice: "Project was successfully deleted"
  end

end


