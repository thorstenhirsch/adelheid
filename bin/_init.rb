#!/usr/bin/env false
#
# don't execute this
# it's meant to be required by ruby scripts

RAILS = File.expand_path("#{File.dirname(__FILE__)}/../rails")

# load rails environment (includes loading rake and rake tasks)
require File.expand_path("#{RAILS}/config/application", __FILE__)
Rails.application.load_tasks

# class AddOrFalseArray < Array
#   # preferred way of changing behaviour,
#   # as long as we control instantiation
#   def <<(element)
#     if defined? element
#       super(element)
#     else
#       return false
#     end
#   end
# end

def rake(task_string, opts={})

  # default behaviour: rake tasks being invoked only once, unless reenabled
  # for multiple execution, so let's just reenable always
  Rake::Task[task_string].reenable
  Rake::Task[task_string].invoke(opts)
  
end

# def rake(task_string, opts={})
#   params = AddOrFalseArray.new
#   (namespace, task) = task_string.split(':')
#
#   case namespace
#   when "artifact_type"
#     raise "unknown task #{task_string}" unless %w(add update).include?(task)
#     params << opts[:name] || abort("name required")
#     params << opts[:category] || abort("category required")
#   when "attribute"
#     raise "unknown task #{task_string}" unless %w(add update).include?(task)
#     params << opts[:name] || abort("name required")
#     params << opts[:number]
#     params << opts[:xpath]
#     params << opts[:searchable]
#   when "config"
#     raise "unknown task #{task_string}" unless %w(get set).include?(task)
#     case task
#     when "get"
#       params << opts[:key]   || abort("key required")
#     when "set"
#       params << opts[:key]   || abort("key required")
#       params << opts[:value] || abort("value required")
#     end
#   when "environment"
#     raise "unknown task #{task_string}" unless %w(add update).include?(task)
#     params << opts[:name]  || abort("name required")
#     params << opts[:group] || abort("group required")
#     params << opts[:number]
#   when "environment_group"
#     raise "unknown task #{task_string}" unless %w(add update).include?(task)
#     params << opts[:name] || abort("name required")
#     params << opts[:number]
#   when "lookup_table"
#     raise "unknown task #{task_string}" unless %w(add update apply insert).include?(task)
#     case task
#     when "add"
#       params << opts[:name] || abort("name required")
#     when "update"
#       params << opts[:name] || abort("name required")
#       params << opts[:from] || abort("from required")
#       params << opts[:to]   || abort("to required")
#     when "apply"
#       params << opts[:name] || abort("name required")
#       params << opts[:on]   || abort("on required")
#     when "insert"
#       params << opts[:name] || abort("name required")
#       opts.each { |k,v| }
#     end
#   else
#     abort "unknown task namespace: #{namespace}"
#   end
#
#   # default behaviour: rake tasks being invoked only once, unless reenabled
#   # for multiple execution, so let's just reenable always
#   Rake::Task[task_string].reenable
#   Rake::Task[task_string].invoke(*params, foo: "bar")
# end
