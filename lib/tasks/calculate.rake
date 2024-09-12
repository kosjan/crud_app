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

end
