class EmployeeController < ApplicationController
  def register()
    params[:code].upcase!
#    params[:name] = params[:name].titlecase
    params[:name] = params[:name].titlecase
    employee  = Employee.find_by_code(params[:code])
    if employee.nil?
      employee = Employee.create(:code  => params[:code], :name => params[:name])
    else
      employee.name = params[:name]
      employee.save!
    end
    render :json => employee
  end
  
  def index
  end
  
  def get()
      record = Employee.find_by_code(params[:id])
      render :json => record
    end
    
  
  
end