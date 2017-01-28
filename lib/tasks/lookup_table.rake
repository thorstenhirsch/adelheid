namespace :lookup_table do

  desc 'add lookup_table'
  task :add => :environment do |t, args|

    opts = {}
    args.extras.each { |h| opts.merge!(h) }

    abort 'name required' unless name = opts[:name]

    from = opts[:from]
    to = opts[:to]

    #puts "adding lookup_table #{name} from #{from} to #{to}..."
    puts "adding lookup_table #{name}..."

  end

  desc 'update lookup_table'
  task :update => :environment do |t, args|

    opts = {}
    args.extras.each { |h| opts.merge!(h) }

    abort 'name required' unless name = opts[:name]

    from = opts[:from]
    to = opts[:to]

    puts "updating lookup_table #{name}: from #{from}, to #{to}..."

  end

  desc 'apply lookup_table'
  task :apply => :environment do |t, args|

    opts = {}
    args.extras.each { |h| opts.merge!(h) }

    abort 'name required' unless name = opts[:name]
    abort 'name required' unless on = opts[:on]

    puts "apply lookup_table #{name}: on #{on}..."

  end

  desc 'insert row into lookup_table'
  task :insert => :environment do |t, args|

    opts = {}
    args.extras.each { |h| opts.merge!(h) }

    abort 'name required' unless name = opts[:name]
    from = opts[:from]
    to = opts[:to]

    puts "inserting into lookup_table #{name}: from #{from}, to #{to}..."

  end
end
