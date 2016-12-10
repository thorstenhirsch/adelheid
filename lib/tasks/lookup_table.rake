namespace :lookup_table do

  desc 'add lookup_table'
  task :add, [ :name, :type ] => :environment do |t, args|

    name = args[:name]
    type = args[:type]

    puts "adding lookup_table #{name} with type #{type}..."

  end

  desc 'update lookup_table'
  task :update, [ :name, :type ] => :environment do |t, args|

    name = args[:name]
    from = args.extras[0]
    to = args.extras[1]

    puts "updating lookup_table #{name}: from #{from}, to #{to}..."

  end

  desc 'apply lookup_table'
  task :apply, [ :name, :on ] => :environment do |t, args|

    name = args[:name]
    on = args[:on]

    puts "apply lookup_table #{name}: on #{on}..."

  end

  desc 'insert row into lookup_table'
  task :insert, [ :name ] => :environment do |t, args|

    name = args[:name]
    from = args.extras[0]
    to = args.extras[1]

    puts "inserting into lookup_table #{name}: from #{from}, to #{to}..."

  end
end
