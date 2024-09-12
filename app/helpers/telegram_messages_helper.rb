module TelegramMessagesHelper
  def send_notification(msg, chat_id)
    encoded_msg = msg.force_encoding('ASCII-8BIT')
    url_string = "https://api.telegram.org/bot#{BOT_TOKEN}/sendMessage?chat_id=#{chat_id}&text=#{encoded_msg}"
    HTTParty.get(URI::encode(url_string))
  end
end
