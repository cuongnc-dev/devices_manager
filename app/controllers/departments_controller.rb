class DepartmentsController < ApplicationController
  before_action :load_department, only: [:edit, :update, :destroy]

  def index
    @departments = Department.all
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new department_params
    if @department.save
      flash[:success] = t "save_success"
      redirect_to departments_url
    else
      flash[:danger] = t "save_error"
      render :new
    end
  end

  def edit
  end

  def update
    if @department.update_attributes department_params
      flash[:success] = t "save_success"
      redirect_to departments_url
    else
      flash[:danger] = t "save_error"
      render :edit
    end
  end

  def destroy
    if @department.destroy
      flash[:success] = t "success"
    else
      flash[:danger] = t "error"
    end
    redirect_to departments_url
  end

  private
  def department_params
    params.require(:department).permit :name
  end

  def load_department
    @department = Department.find_by id: params[:id]
    unless @department
      flash[:danger] = t "error"
    end
  end
end
