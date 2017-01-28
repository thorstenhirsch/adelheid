namespace :environment_group do

  desc 'add environment_group'
  task :add => :environment do |t, args|

    opts = {}
    args.extras.each { |h| opts.merge!(h) }

    abort 'name required' unless name = opts[:name]
    number = opts[:number]

    if number.nil?
      number = EnvironmentGroup.maximum(:number)
      number ||= 0
      number += 10
    end

    eg = EnvironmentGroup.find_or_initialize_by(name: name)
    next unless eg.new_record?

    puts "adding environment_group #{name} with number #{number}..."
    eg.number = number
    eg.save!

  end

  desc 'update environment_group'
  task :update => :environment do |t, args|

    opts = {}
    args.extras.each { |h| opts.merge!(h) }

    abort 'name required' unless name = opts[:name]
    eg = EnvironmentGroup.find_by!(name: name)

    if number = opts[:number]
      puts "updating environment_group #{name} with number #{number}..."
      eg.number = number
    end

    eg.save!

  end
end
