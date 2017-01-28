namespace :deployment do

  desc 'add deployment id'
  task :add_id => :environment do |t, args|

    opts = {}
    args.extras.each { |h| opts.merge!(h) }

    abort 'name required' unless name = opts[:name]

    puts "adding deployment id #{name}..."

    #Deployment.create!(
    #  name: name
    #)
  end

  desc 'add deployment info'
  task :add_info, [ :name ] => :environment do |t, args|

    opts = {}
    args.extras.each { |h| opts.merge!(h) }

    abort 'name required' unless name = opts[:name]

    puts "adding deployment info #{name}..."

  end
end
