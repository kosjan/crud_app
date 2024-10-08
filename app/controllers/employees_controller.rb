class EmployeesController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_employee, only: %i[ show edit update destroy jeditable]
  before_action :correct_user, only: %i[ edit update destroy ]


  require 'telegram/bot'
  # token = '7334438796:AAHEg9yvIOtmVdKvZghkqUlubREjWJfnQWE'
  # Telegram::Bot::Client.run(token) do |bot|
  #   bot.listen do |message|
  #     case message.text
  #     when '/start'
  #       bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
  #     when '/stop'
  #       bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
  #     end
  #   end
  # end

  # GET /employees or /employees.json
  def index
    @employees = Employee.all
  end


  # GET /employees/1 or /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    #@employee = Employee.new
    @employee = current_user.employees.build
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees or /employees.json
  def create
    #@employee = Employee.new(employee_params)
    @employee = current_user.employees.build(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: "Employee was successfully created." }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: "Employee was successfully updated." }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1 or /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: "Employee was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  #Настройка редактируемых полей в таблице

  def jeditable
    column = params[:column]
    val = params[:vk]
    @employee[column] = val
    if @employee.save
      flash[:notice]='Запись была успешно обновлена.'
      render :plain=> @employee.vk
    else
      flash[:alert]='Запись не обновлена.'
      render :plain => @employee[column]
    end
  end


def correct_user
  @user = current_user.friends.find_by(id: params[:id])
  redirect_to employees_path, notice: "Not allowed to edit this employee" if  @user.nil?
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:first_name, :second_name, :email, :phone, :vk, :user_id)
    end
end
