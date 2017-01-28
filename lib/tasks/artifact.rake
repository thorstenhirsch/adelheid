namespace :artifact do

  desc 'add artifact'
  task :add => :environment do |t, args|

    opts = {}
    args.extras.each { |h| opts.merge!(h) }

    abort 'name required' unless name = opts[:name]
    abort 'type required' unless type = opts[:type]

    puts "adding artifact #{name} with type #{type}..."

    type = ArtifactType.find_by(name: type)
    Artifact.create!(
      name: name,
      type: type
    )

  end

  desc 'update artifact'
  task :update => :environment do |t, args|

    opts = {}
    args.extras.each { |h| opts.merge!(h) }

    abort 'name required' unless name = opts[:name]

    a = Artifact.find_by!(name: name)
    if type = opts[:type]
      puts "updating artifact #{name}: type #{type}..."
      a.artifact_type = type
    end

    if searchable = opts[:searchable]
      puts "updating artifact #{name}: searchable #{searchable}..."
      a.searchable = searchable
    end

  end
end
