namespace :environment do

  desc 'add environment_group'
  task :add, [ :name, :group ] => :environment do |t, args|

    name = args[:name]
    group = args[:group]
    number = args.extras[0] || Environment.order(:number).last.to_i + 10

    puts "adding environment #{name} in group #{group} with number #{number}..."

  end
end
