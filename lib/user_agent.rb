class UserAgent
  # Creates a new UserAgent object.
  #
  # == Parameters
  # * ua_string: The user agent as you got it
  def initialize(ua_string)
    raise NotImplementedError
  end

  # Returns the architecture as a lower case symbol like :i686 or :ppc
  def architecture
    raise NotImplementedError
  end
  
  # Returns true, if the user agent is suspected or known to be a bot.
  def bot?
    raise NotImplementedError
  end

  # Returns true, if the user agent is known or suspected to be a browser
  def browser?
    raise NotImplementedError
  end

  # Returns the complete user agent version, as given by the user agent
  def complete_version
    raise NotImplementedError
  end

  # Returns true, if the given user agent is suspected or known to be a feed
  # reader.
  def feed_reader?
    raise NotImplementedError
  end

  # Returns true, if the given user agent is know, otherwise false
  def known?
    raise NotImplementedError
  end

  # Returns the name of the user agent.
  def name
    raise NotImplementedError
  end

  # Returns the operating system as a string. Returns nil if the operating
  # system is unknown.
  # For Linux systems, the name of the distribution will be returned, or
  # "Unknown Linux Distribution"
  def os
    raise NotImplementedError
  end

  # Returns the type of the operating system as a String, like "Linux" or
  # "Windows". Returns nil, if the os is unknown.
  def os_type
    raise NotImplementedError
  end

  # Returns the operating system as a string. Returns nil if the operating
  # system version is unknown
  def os_version
    raise NotImplementedError
  end

  # Returns the name of the render engine as a string if known, otherwise nil.
  def render_engine
    raise NotImplementedError
  end

  # Returns the version of the render engine if known, otherwise nil
  def render_engine_version
    raise NotImplementedError
  end

  # Returns the user interface language as a symbol like :en or :de. Returns nil
  # if the user interface language is not known.
  def ui_lang
    raise NotImplementedError
  end

  # Returns the country code from the user interface language as a lower case
  # symbol. For example, en_US will return :us. Returns nil if the country is
  # unknown.
  def ui_lang_country
    raise NotImplementedError
  end

  # Returns the major version of the user agent as a String, if known. For
  # example, for the Firefox 3.0.5 "3.0" will be returned. If the version is
  # unknown, nil will be returned.
  def version
    raise NotImplementedError
  end
end
