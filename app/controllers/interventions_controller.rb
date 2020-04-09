class InterventionsController < InheritedResources::Base
  before_action :authenticate_employee!

  def new
    @intervention = Intervention.new #generate data blank to create new form
  end

  def create
    @intervention = Intervention.new(intervention_params)
    
    if @intervention.save
      flash[:notice] = "add new intervention successful"
      redirect_to :index
    else
      flash[:notice] = "add new intervention not successful"
      redirect_to action:"new"
    end
  end

  def get_building_by_customer
    @buildings = Building.where("customer_id = ?", params[:customer_id])
    respond_to do |format|
      format.json { render :json => @buildings }
    end
  end 

  def get_battery_by_building
    @batteries = Battery.where("building_id = ?", params[:building_id])
    respond_to do |format|
      format.json { render :json => @batteries }
    end
  end 

  def get_column_by_battery
    @columns = Column.where("battery_id = ?", params[:battery_id])
    respond_to do |format|
      format.json { render :json => @columns }
    end
  end 

  def get_elevator_by_column
    @elevators = Elevator.where("column_id = ?", params[:column_id])
    respond_to do |format|
      format.json { render :json => @elevators }
    end
  end 

  private

  def intervention_params
    params[:intervention][:author_id] = current_employee.id
    params[:intervention][:date_started] = nil
    params[:intervention][:date_ended] = nil
    if params[:intervention][:column_id] == "nulltest"
      params[:intervention][:column_id] = nil
    end
    if params[:intervention][:elevator_id] == "nulltest"
      params[:intervention][:elevator_id] = nil
    end
    if params[:intervention][:employee_id] == "None"
      params[:intervention][:employee_id] = nil
    end
    # params[:intervention][:result] = nil
    # params[:intervention][:status] = nil
    params.require(:intervention).permit(:customer_id, :employee_id, :building_id, :battery_id, :column_id, :elevator_id, :report, :author_id, :date_started, :date_ended, :result, :status)
  end

end
