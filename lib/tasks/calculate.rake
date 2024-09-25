require "#{Rails.root}/app/helpers/calculate_helper"
require "#{Rails.root}/app/helpers/telegram_messages_helper"
include TelegramMessagesHelper
include CalculateHelper


namespace :calculate do
  desc "Пересчет энергий на месяц"
  task month_energy: :environment do
    birthday = "11.10.1997"
    chat_id_kostua = '468429182'
    chat_id_tasja = '996966101'
    send_notification(calculate_month_energy(birthday).join(' ') + " ваши данные для построения графика", chat_id_kostua)
  end

  desc "Расчет аркана личности"
  task arcane_of_personality: :environment do
    birthday = "24.04.1994"
    arcane_of_personality = calculate_arcane_of_personality(birthday)
    send_notification("Расчет аркана личности", TASJA_ID_CHAT)
    arcane_of_personality.each do |key, value|
      send_notification("#{key} - #{value}", TASJA_ID_CHAT)
    end
  end

  desc "Расчет трансформационных годов"
  task transform_year: :environment do
    birthday = "24.04.1994"
    trans_dates = calculate_transform_year(birthday)
    send_notification("Расчет трансформационных годов", KOSTUA_ID_CHAT)
    trans_dates.each_with_index do |(key, value), index|
      send_notification("Ваш #{index+1} год - #{value}. В это время вам будет - #{key}", KOSTUA_ID_CHAT)
    end
  end

  desc "Расчет карты судьбы"
  task map_of_destiny: :environment do
    birthday = "24.04.1994"
    calculate_map_of_destiny = calculate_map_of_destiny(birthday)
    send_notification("Расчет карты судьбы", TASJA_ID_CHAT)
    calculate_map_of_destiny.each_with_index do |(key, value), index|
      send_notification("В период #{value["Период #{index+1}"]}, у вас урок -  #{value["Урок #{index+1}"]} и вашей целью является - #{value["Цель #{index+1}"]}", TASJA_ID_CHAT)
    end
  end

  desc "Расчет квадрата личности"
  task square_of_personality: :environment do
    birthday = "24.04.1994"
    calculate_square_of_personality = calculate_square_of_personality(birthday)
    send_notification("Расчет квадрата личности", KOSTUA_ID_CHAT)
    calculate_square_of_personality.each do |key, value|
      send_notification("#{key} - #{value}", KOSTUA_ID_CHAT)
    end
  end

  desc "Расчет линии судьбы"
  task line_of_destiny: :environment do
    send_notification("Расчет линии судьбы", TASJA_ID_CHAT)
    birthday = "24.04.1994"
    lines = calculate_line_of_destiny(birthday)
    lines.each do |key, value|
      send_notification("В периоде жизни #{key}, ваша энергия -  #{value}", TASJA_ID_CHAT)
    end
  end

end
