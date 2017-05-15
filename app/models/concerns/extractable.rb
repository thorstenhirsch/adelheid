module Extractable
  extend ActiveSupport::Concern

  XMLROOT = '_extractable_root' # nobody will ever use this, right?

  def extract_to(target, opts={})
    application = opts[:application] || self.application
    raise "appication required" unless application.present?

    # haven't found a solution without root element, so let's use XMLROOT
    xml = Nokogiri::XML(self.to_xml(root: XMLROOT.to_sym, skip_instruct: true, indent: 0))
    puts "XML: #{xml}" ###

    properties = opts[:properties] || application.properties
    properties.each do |p|
      value = extract_property(p)
      next unless value.present?

      begin
        # assignment with send, the '=' is part of the symbol's name
        target.send("#{p.name}=".to_sym, value)
      rescue => e
        puts "ERROR: property #{p.name} found, but #{target} has no such attribute, msg: #{e.message}"
      end
    end
  end

  # at the end build all fields with a proc
  # -> can use all previously fetched fields
  #proc_fields = [
  #   { name: "Schnittstelle",
  #     number: 10,
  #     proc: "#{srcsysid} / #{msgtype}" }
  #]

  def extract_and_create(name, attribute=nil)
    elements = xml.xpath("/#{XMLROOT}/#{name}")
    elements.each do |e|
      if attribute.present?
      e = e.xpath("/#{attribute}") # nope
    end
    klass = name.safe_constantize
    object = klass.find_or_create_by(name: artifact_name)
      deployment.artifacts << artifact
    end
  end

  ###
  # methods defined here are going to extend the class, not the instance of it
  # class_methods do
  #   def key_for_classname_and_args(classname, args)
  #     CONFIG['user'] + ":worker:#{classname}:" + args.to_s
  #   end
  # end

  private

  def extract_property(p)
    if p.xpath.present?
      # user input -> can fail
      begin
        fixed = fix_xpath(p.xpath) # user's xpath is without /XMLROOT
        value = xml.xpath(fixed)
        value = value.text() unless value.is_a? String
        puts "searched for #{fixed}, found: #{value}" ###
      rescue => e
        puts "ERROR: dynamic property failed, xpath: #{p.xpath}, fixed: #{fixed}, msg: #{e.message}"
        next
      end
    else
      value = xml.at_xpath("/#{XMLROOT}/#{p.name}").try(:text)
      puts "searched for /#{XMLROOT}/#{p.name} in /#{xml.name}, found: #{value}" ###
    end

    value
  end

  def fix_xpath(xpath)
    # everything that begins with a slash except when a slash is before the slash
    xpath.gsub %r{(?![^/])(/[\w]+)}, "/#{XMLROOT}\\1"
    # actually I tried to implement a "lookbehind no slash", (?:[^/])
    # but that didn't work out, it dismissed the char before the / in \1
    # now what seems to work is a negative lookahead, (?![^/])
  end
end
