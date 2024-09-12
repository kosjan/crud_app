namespace :calculate do
  desc "Пересчет энергий на месяц"
  task month_energy: :environment do
    def send_notification(msg)
      tg_bot_key = '7334438796:AAHEg9yvIOtmVdKvZghkqUlubREjWJfnQWE'
      chat_id_kostua = '468429182'
      chat_id_tasja = '996966101'
      encoded_msg = msg.force_encoding('ASCII-8BIT')
      url_string = "https://api.telegram.org/bot#{tg_bot_key}/sendMessage?chat_id=#{chat_id_kostua}&text=#{encoded_msg}"
      HTTParty.get(URI::encode(url_string))
    end
    birthday = "11.10.1997"
    dates = birthday.split('.')
    array = ((dates.first + dates.second).to_i * dates.third.to_i).to_s.split('').map{|i| i.to_i}
    send_notification(array.join(' ') + " ваши данные для построения графика")

  end

end
