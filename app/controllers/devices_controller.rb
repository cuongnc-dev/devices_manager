class DevicesController < ApplicationController
  before_action :load_department, except: :destroy
  before_action :load_device, only: [:edit, :update, :destroy]

  def index
    file_name = t "file_name"
    respond_to do |format|
      format.html
      format.xlsx do
        headers["Content-Disposition"] = "attachment; filename=\"#{file_name}(#{Date.today}).xlsx\""
        headers["Content-Type"] ||= "xlsx"
      end
    end
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new device_params
    if @device.save
      flash[:success] = t "save_success"
      redirect_to devices_url
    else
      flash[:danger] = t "save_error"
      render :new
    end
  end

  def edit
  end

  def update
    if @device.update_attributes device_params
      flash[:success] = t "save_success"
      redirect_to devices_url
    else
      flash[:danger] = t "save_error"
      render :edit
    end
  end

  def destroy
    if @device.destroy
      flash[:success] = t "success"
    else
      flash[:danger] = t "error"
    end
    redirect_to devices_url
  end

  private
  def device_params
    params.require(:device).permit :name, :country_produce, :year_produce,
      :year_use, :unit, :unit_price, :quantity_account_book,
      :quantity_actual_inventory, :quantity_redundancy, :quantity_missing,
      :note, :source, :status, :department_id
  end

  def load_device
    @device = Device.find_by id: params[:id]
    unless @device
      flash[:danger] = t "error"
    end
  end

  def load_department
    if params[:find_by]
      case params[:find_by]
      when "0"
        @departments = Department.find_department params[:name]
      when "1"
        @devices = Device.find_device params[:name]
      end
    else
      @departments = Department.all
    end
  end
end
