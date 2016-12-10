namespace :deployment do

  desc 'add deployment id'
  task :add_id, [ :name ] => :environment do |t, args|

    name = args[:name]

    puts "adding deployment id #{name}..."

  end

  desc 'add deployment info'
  task :add_info, [ :name ] => :environment do |t, args|

    name = args[:name]

    puts "adding deployment info #{name}..."

  end
end
