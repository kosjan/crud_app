module CalculateHelper
  def calculate_month_energy(birthday)
    dates = birthday.split('.')
    return array = ((dates.first + dates.second).to_i * dates.third.to_i).to_s.split('').map{|i| i.to_i}
  end
end
