namespace :artifact_type do

  desc 'add artifact_type'
  task :add => :environment do |t, args|

    opts = {}
    args.extras.each { |h| opts.merge!(h) }

    abort 'name required' unless name = opts[:name]
    abort 'category required' unless category = opts[:category]

    puts "adding artifact_type #{name} of category #{category}..."

    ac = ArtifactCategory.find_by!(name: category)
    at = ArtifactType.find_or_initialize_by(name: name)
    next unless at.new_record?

    at.artifact_category = ac
    at.save!

  end

  desc 'update artifact_type'
  task :update => :environment do |t, args|

    opts = {}
    args.extras.each { |h| opts.merge!(h) }

    abort 'name required' unless name = opts[:name]
    at = ArtifactType.find_by!(name: name)

    if category = opts[:category]
      puts "updating artifact_type #{name} with category #{category}..."
      at.category = category
    end

    # if searchable = opts[:searchable]
    #   puts "updating artifact_type #{name} with searchable #{searchable}..."
    #   at.searchable = searchable
    # end

    at.save!

  end
end
