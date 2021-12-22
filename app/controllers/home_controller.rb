class HomeController < ApplicationController
  def index
  end
  def about
    @users = Employee.all
    #byebug
    respond_to do |format|
      format.html
      format.xlsx{
        response.headers['Content-Disposition'] = 'attachment; filename="Отчет.xlsx"'
      }
    end
  end
end
