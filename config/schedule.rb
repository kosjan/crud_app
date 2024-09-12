set :output, "log/cron_log.log"


every '0 9 28 * *' do
#every 5.minutes do
  rake 'calculate:month_energy'
end
