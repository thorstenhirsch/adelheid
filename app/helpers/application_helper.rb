module ApplicationHelper

  def get_application_name(opts)
    if Configuration.get("applications") == 1
      name = opts[:application] || opts["application"]
      raise "application required" if name.nil?
    else
      name = Configuration.get("default_application_name")
      raise "no default_application_name set, this should never happen" if name.nil?
      Application.find_or_create_by!(name: name) # make sure it exists, the caller probably needs it
    end

    name
  end

  def xpath_case_insensitive(xml, xpath)
    raise "not implemented, yet"
    # translate('some text','abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')
    # http://stackoverflow.com/questions/2279513/how-can-i-create-a-nokogiri-case-insensitive-xpath-selector
  end
end
