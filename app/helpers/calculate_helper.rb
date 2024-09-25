module CalculateHelper

  def calculate_matrix(birthday)
    return 0
  end

  # Расчет линии чудьбы

  def calculate_line_of_destiny(birthday)
    dates = birthday.split('.')
    array = ((dates.first + dates.second).to_i * dates.third.to_i).to_s.split('').map{|i| i.to_i}
    hash = {}
    array.each_with_index do |arr, ind|
      if ind*12 >= 72
        key = "72+"
      else
        key = "#{ind*12}-#{(ind+1)*12}"
      end
      hash[key] = arr.to_s + ": Описание энергии"
    end
    return hash
  end

  # Расчет месячной энергии

  def calculate_month_energy(birthday)
    matrix = calculate_matrix(birthday)
  end

  # Расчет аркана личности

  def calculate_arcane_of_personality(birthday)
    dates = birthday.split('.')
    power = dates.first.to_i > 22 ? dates.first.to_i - 22 : dates.first.to_i
    lesson = dates.second.to_i
    year_sum = dates.last.split("").map(&:to_i).sum
    result = year_sum > 22 ? year_sum - 22 : year_sum
    return {"Источник силы: #{power.to_s}" => "Описание источника силы", "Урок: #{lesson.to_s}" => "Описание урока", "Итог, к которому стремится душа: #{result.to_s}" => "Описание итога"}
  end

  # Расчет карты судьбы

  def calculate_map_of_destiny(birthday)
    dates = birthday.split('.')
    day_number = dates.first.to_i > 22 ? dates.first.to_i - 22 : dates.first.to_i
    month_number = dates.second.to_i
    year_number = dates.last.split("").map(&:to_i).sum
    result = year_number > 22 ? year_number - 22 : year_number
    number_of_way_life_parce = dates.first.split("").map(&:to_i).sum + dates.second.split("").map(&:to_i).sum + dates.last.split("").map(&:to_i).sum
    number_of_way_life = number_of_way_life_parce > 22 ? number_of_way_life_parce.to_s.split("").map(&:to_i).sum : number_of_way_life_parce
    hash_of_targets = {"Цель 1" => "Аркан #{(day_number+month_number).to_s}: Описание первой цели",
                       "Цель 2" => "Аркан #{(day_number+result).to_s}: Описание второй цели",
                       "Цель 3" => "Аркан #{((day_number+result)+(day_number+month_number)).to_s}: Описание третьей цели",
                       "Цель 4" => "Аркан #{(month_number+result).to_s}: Описание четвертой цели"}
    hash_of_lessons = {"Урок 1" => "Аркан #{(day_number-month_number).abs.to_s}: Описание первого урока",
                       "Урок 2" => "Аркан #{(day_number-result).abs.to_s}: Описание второго урока",
                       "Урок 3" => "Аркан #{((day_number-result)+(day_number-month_number)).abs.to_s}: Описание третьего урока",
                       "Урок 4" => "Аркан #{(month_number-result).abs.to_s}: Описание четвертого урока"}
    hash_map = {}
    (0..3).each do |ind|
      hash_map[ind+1] = {}
      hash_map[ind+1]["Период #{ind+1}"] = "c #{ind == 0 ? ind : 36-number_of_way_life+(9*(ind-1))} до #{36-number_of_way_life+(9*ind)}"
      hash_map[ind+1]["Цель #{ind+1}"] = hash_of_targets["Цель #{ind+1}"]
      hash_map[ind+1]["Урок #{ind+1}"] = hash_of_lessons["Урок #{ind+1}"]
    end
    # hash_map = {"Цели":hash_of_targets, "Уроки": hash_of_lessons, "Периоды": hash_of_periods}
    return hash_map
  end

  # Расчет квадрата личности

  def calculate_square_of_personality(birthday)
    dates = birthday.split('.')
    day_sum = dates.first.to_i < 22 ? dates.first.to_i : dates.first.split("").map(&:to_i).sum
    mount_sum = dates.second.to_i
    year_sum = dates.last.split("").map(&:to_i).sum < 22 ? dates.last.split("").map(&:to_i).sum :
                                                           (dates.last.split("").map(&:to_i).sum).to_s.split("").map(&:to_i).sum
    carmick = (day_sum+mount_sum+year_sum) < 22 ? day_sum+mount_sum+year_sum :
                                                  (day_sum+mount_sum+year_sum).to_s.split("").map(&:to_i).sum
    heart = (day_sum+mount_sum+year_sum+carmick) < 22 ? day_sum+mount_sum+year_sum+carmick :
                                                  (day_sum+mount_sum+year_sum+carmick).to_s.split("").map(&:to_i).sum
    return {"Портрет" => day_sum, "Высшая суть" => mount_sum, "Задачи души" => year_sum, "Кармическая задача" => carmick, "Сердце матрицы" => heart}
  end

  # Расчет трансформационных годов

  def calculate_transform_year(birthday)
    dates = birthday.split('.')
    year_sum = dates.last.split("").map(&:to_i).sum
    years_hash = {}
    trans_dates = year_sum
    while trans_dates < 70 do
      years_hash["#{trans_dates}"] = trans_dates + dates.last.to_i
      trans_dates += year_sum
    end
    return years_hash
  end
end
