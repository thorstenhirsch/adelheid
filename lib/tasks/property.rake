namespace :property do

  desc 'add property'
  task :add => :environment do |t, args|

    opts = {}
    args.extras.each { |h| opts.merge!(h) }

    abort 'name required' unless name = opts[:name]

    include ApplicationHelper
    application = get_application_name(opts)

    a = Application.find_by!(name: application)
    p = Property.find_or_initialize_by(
      name: name,
      application: a
    )
    next unless p.new_record?

    if show = opts[:show]
      p.show = show
    end
    if xpath = opts[:xpath]
      p.xpath = xpath
    end

    puts "adding property #{name} for application #{application}..."
    p.save!

    # alter deployments table
    m = ActiveRecord::Migration[5.0].new
    m.add_column :deployments, name.to_sym, :string
    m.add_index :deployments, name.to_sym
  end

  desc 'del property'
  task :del => :environment do |t, args|

    opts = {}
    args.extras.each { |h| opts.merge!(h) }

    abort 'name required' unless name = opts[:name]

    include ApplicationHelper
    application = get_application_name(opts)

    a = Application.find_by!(name: application)
    p = Property.find_by!(name: name, application: a)

    puts "removing property #{name} for application #{application}..."
    p.delete

    # alter deployments table
    m = ActiveRecord::Migration[5.0].new
    m.remove_column :deployments, name.to_sym
    m.remove_index :deployments, name.to_sym
  end

  desc 'update property'
  task :update => :environment do |t, args|

    opts = {}
    args.extras.each { |h| opts.merge!(h) }

    abort 'name required' unless name = opts[:name]
    p = Property.find_by!(name: name)

    if application = opts[:application]
      puts "updating property #{name} with application #{application}..."
      p.application = Application.find_by!(name: application)
    end

    if show = opts[:show]
      puts "updating property #{name} with show #{show}..."
      p.show = show
    end

    if xpath = opts[:xpath]
      puts "updating property #{name} with xpath #{xpath}..."
      p.xpath = xpath
    end

    p.save!

  end
end
