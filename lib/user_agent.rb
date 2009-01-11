class UserAgent
  # Creates a new UserAgent object.
  #
  # == Parameters
  # * ua_string: The user agent as you got it
  def initialize(ua_string)
    @ua_string = ua_string.strip.downcase
    @known = false
    @bot = false
    @feed_reader = false
    @name = "Unknown browser"

    if @ua_string == ""
      @name = "No user agent given"
      return
    end

    inner_part = nil
    distry_part = nil
    after_part = nil

    # Flock and some versions of the Netscape Navigator try to identify themself
    # also as a Firefox, so we have to identify them first.
    [:flock, :navigator].each do |browser|
      match = /mozilla\/5\.0 \(([^)]+); rv:([^; )]+)\) gecko\/20[0-2][0-9][01][0-9][0-3][0-9][0-9]* firefox\/[^ ]+ #{browser}\/([^ ]+)(.*)/.match(@ua_string)
      if !@known && match
        @known = true
        @name = browser
        @render_engine = :gecko
        inner_part = match[1]
        @render_engine_version = match[2]
        @version = match[3]
        after_part = match[4]
      end
    end

    # Identify all other gecko based browsers except the orginal mozilla
    [:bonecho, :camino, :epiphany, :firefox, :granparadiso, :iceweasel, :"k-meleon", :minefield, :netscape, :phoenix, :seamonkey, :songbird, :thunderbird].each do |browser|
      match = /mozilla\/5\.0 \(([^)]+); rv:([^; )]+)\) gecko\/20[0-2][0-9][01][0-9][0-3][0-9][0-9]*( [^ ]+)?( \([^)]+\))? #{browser}\/([^ ]+)(.*)/.match(@ua_string)
      if !@known && match
        @known = true
        @name = browser
        @render_engine = :gecko
        inner_part = match[1]
        @render_engine_version = match[2]
        distry_part = match[3]
        @version = match[5]
        after_part = match[6]
      end
    end

    if @known
      # Identify the ua vendor

    end
  end

  # Returns the architecture as a lower case symbol like :i686 or :ppc
  def architecture
    raise NotImplementedError
  end
  
  # Returns true, if the user agent is suspected or known to be a bot.
  def bot?
    @bot
  end

  # Returns true, if the user agent is known or suspected to be a browser.
  # Completely unknown user agents are also suspected browsers. Check known?, if
  # you want to make sure the browser is known.
  def browser?
    !@bot && !@feed_reader
  end

  # Returns the complete user agent version, as given by the user agent
  def complete_version
    @version
  end

  # Returns true, if the given user agent is suspected or known to be a feed
  # reader.
  def feed_reader?
    @feed_reader
  end

  # Returns true, if the given user agent is know, otherwise false
  def known?
    @known
  end

  # Returns the name of the user agent.
  def name
    @name
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
    @render_engine
  end

  # Returns the version of the render engine if known, otherwise nil
  def render_engine_version
    @render_engine_version
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

  # Returns the vendor of the user agent, if known. Otherwise nil will be
  # returned.
  def vendor
    raise NotImplementedError
  end

  # Returns the major version of the user agent as a String, as it is commonly
  # known. For example, for the Firefox 3.0.5 "3.0" will be returned, but for
  # the Internet Explorer 7.0 will return "7" (in contrast to Internet Explorer
  # 5.5). If the version is unknown, nil will be returned.
  def version
    defs = {:two => {:browsers => [:flock, :firefox], :regexp => /^([0-9]+\.[0-9]+)\./}}
    defs.each_key do |key|
      if defs[key][:browsers].include?(@name)
        return defs[key][:regexp].match(@version)[1]
      end
    end

    case @name
    when :navigator # major.minor till navigator 4.0, major afterwards
      (@version =~ /^[0-4]/) ? /^([0-9]+\.[0-9]+)\./.match(@version)[1] : /^([0-9]+)\./.match(@version)[1]
    end
  end
end
