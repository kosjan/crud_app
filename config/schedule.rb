set :output, "log/cron_log.log"


every '0 9 28 * *' do
  rake 'calculate:month_energy'
end
