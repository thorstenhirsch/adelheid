namespace :artifact_type do

  desc 'add artifact_type'
  task :add, [ :name, :type ] => :environment do |t, args|

    name = args[:name]
    type = args[:type]

    puts "adding artifact_type #{name} with type #{type}..."

  end

  desc 'update artifact_type'
  task :update, [ :name, :type ] => :environment do |t, args|

    name = args[:name]
    type = args.extras[0]
    searchable = args.extras[1]

    puts "updating artifact_type #{name}: type #{type}, searchable #{searchable}..."

  end
end
