class EmployeesController < ApplicationController
    before_action :set_employee, only: [:show, :create, :edit] 
    
    def index
        @employees = Employee.all 
    end 

    def new
        @employee = Employee.new 
    end 
    
    def show 
    end 


    def create 
        @employee = Employee.create(employee_params)
        if @employee.valid? 
            redirect_to employee_path(@employee)
        else 
            Flash[:my_errors] = @employee.errors.full_messages
            redirect_to new_employee_path(@employee)
        end 
    end 

    def update
         if @employee.update(employee_params)
            redirect_to employee_path(@employee)
         else 
            Flash[:my_errors] = @employee.errors.full_messages
            redirect_to edit_employee_path(@employee)
            end 
        end 

    private 

    def employee_params 
        params.require(:dog).permit(:name, :breed, :age)
    end 

    def set_employee 
        @employee = Employee.find(params[:id])
    end 
end
