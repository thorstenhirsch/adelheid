namespace :environment_group do

  desc 'add environment_group'
  task :add, [ :name ] => :environment do |t, args|

    name = args[:name]
    number = args.extras[0] || EnvironmentGroup.order(:number).last.to_i + 10

    puts "adding environment_group #{name} with number #{number}..."

  end
end
