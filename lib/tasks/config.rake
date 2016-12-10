namespace :config do

  desc 'set key=value'
  task :set, [ :key, :value ] => :environment do |t, args|

    key = args[:key]
    value = args[:value]

    puts "setting #{key}=#{value}..."
    Configuration.set(key, value)

  end
end
