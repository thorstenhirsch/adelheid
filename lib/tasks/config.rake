namespace :config do

  desc 'set key=value'
  task :set => :environment do |t, args|

    opts = {}
    args.extras.each { |h| opts.merge!(h) }

    abort 'key required' unless key = opts[:key]
    abort 'key required' unless value = opts[:value]

    Configuration.set(key, value)
    puts "set: #{key}=#{value}"

  end

  desc 'get key'
  task :get => :environment do |t, args|

    opts = {}
    args.extras.each { |h| opts.merge!(h) }

    abort 'key required' unless key = opts[:key]
    value = Configuration.get(key)

    puts "got: #{key}=#{value}"

  end
end
