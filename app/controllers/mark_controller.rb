class MarkController < ApplicationController
  @ts
  def get
    record = Mark.find(params[:id])
    render :json => record
  end

  def add
    params.require(:code)
    params.require(:ts)
    params.require(:mode)
    
    params[:code].upcase!
    employee = Employee.find_by_code(params[:code])
    @ts       = Time.at(params[:ts])
      
    if employee.nil?
      render :json =>  "Code " + params[:code] + " not found in employee records.", :status => :"not_found"
      return 
    end
    
    if params[:mode] == '?'
      createOrUpdateEntry(employee.id )
    else
      createNewEntry(employee.id);
    end
     
  end
  
  private
  def getLastEntry( employee_id)
#    Rails.logger.debug(ts.inspect)
    return Mark.where("date(ts) =  ? AND employee_id = ?", @ts.to_date, employee_id ).last
   end
   
   def createNewEntry(employee_id)
     newMark = Mark.create(:employee_id => employee_id, :ts => @ts, :mode => params[:mode])
 
     success =  !newMark.nil? 
     response = {:success => success , :mode =>  params[:mode]}
     render :json => response
   end
   
  def createOrUpdateEntry(employee_id)
    ts          = @ts
    lastRecord  = getLastEntry(employee_id)
    update      = !lastRecord.nil? && lastRecord.mode == "O"
    success     = false  
  if update
    lastRecord.ts = ts ;
    mode          = lastRecord.mode
    success = lastRecord.save!
  else
    mode = lastRecord.nil?  ? "I" : "O"
    newRecord             = Mark.new
    newRecord.employee_id = employee_id
    newRecord.ts          = ts
    newRecord.mode        = mode
    newRecord.save!
  end
  render :json => {:success => success, :mode => mode }
  end
end
   
