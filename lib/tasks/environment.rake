namespace :environment do

  desc 'add environment'
  task :add => :environment do |t, args|

    opts = {}
    args.extras.each { |h| opts.merge!(h) }

    abort 'name required' unless name = opts[:name]
    number = opts[:number]

    # this rake task behaves differently depending on...
    environment_groups = Configuration.get("environment_groups")

    if environment_groups
      group = opts[:group]
      abort 'group required' if group.nil?

      eg = EnvironmentGroup.find_by!(name: group)
      if number.nil?
        number = Environment.where(environment_group: eg).maximum(:number)
        number ||= 0
        number += 10
      end

      e = Environment.find_or_initialize_by(name: name, environment_group: eg)
      next unless e.new_record?

      puts "adding environment #{name} in group #{group} with number #{number}..."
    else
      if number.nil?
        number = Environment.maximum(:number)
        number ||= 0
        number += 10
      end

      e = Environment.find_or_initialize_by(name: name)
      next unless e.new_record?

      puts "adding environment #{name} with number #{number}..."
    end

    e.number = number
    e.save!

  end
end
