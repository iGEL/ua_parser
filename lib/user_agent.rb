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
    @other = false
    @name = "Unknown browser"
    @urls = []
    @emails = []
    @dot_net_versions = []

    if @ua_string == ""
      @name = "No user agent given"
      return
    end

    inner_part = nil
    distry_part = nil
    after_part = nil

    # First we identify bots
    match = /^mozilla\/5.0 \(compatible; (googlebot|yahoo! slurp)(\/([^)]+))?; \+?(http:\/\/[^)]+)\)$/.match(@ua_string)
    if !@known && match
      @known = true
      @name = match[1].to_sym
      @bot = true
      @urls << match[4]
      @version = match[3]
    end
    
    unless @known
      match = /^(msnbot|msnbot-media|baiduspider)(\/([^+ ]+))?[ +]\(\+(http:\/\/[^)]+)\)$/.match(@ua_string)
      if !@known && match
        @known = true
        @name = match[1].to_sym
        @bot = true
        @urls << match[4]
        @version = match[3]
      end
    end

    unless @known
      match = /^mozilla\/4.0 \(compatible; msie ([0-9]\.[0-9]); ([^)]+)\)(.*)$/.match(@ua_string)
      if match
        @known = true
        @name = :internet_explorer
        @render_engine = :trident
        @version = match[1]
        inner_part = match[2]
        after_part = match[3]
      end
    end

    unless @known
      # Flock and some versions of the Netscape Navigator try to identify themself
      # also as a Firefox, so we have to identify them first.
      match = /^mozilla\/5\.0 \(([^)]+); rv:([^; )]+)\) gecko\/20[0-2][0-9][01][0-9][0-3][0-9][0-9]* firefox\/[^ ]+ (flock|navigator)\/([^ ]+)(.*)$/.match(@ua_string)
      if !@known && match
        @known = true
        @name = match[3].to_sym
        @render_engine = :gecko
        inner_part = match[1]
        @render_engine_version = match[2]
        @version = match[4]
        after_part = match[5]
      end
    end

    unless @known
      # Identify all other gecko based browsers except the orginal mozilla
      match = /^mozilla\/5\.0 \(([^)]+); rv:([^; )]+)\) gecko\/20[0-2][0-9][01][0-9][0-3][0-9][0-9]*( [^ ]+)?( \([^)]+\))? (bonecho|camino|epiphany|firefox|granparadiso|iceweasel|k-meleon|minefield|netscape6?|phoenix|seamonkey|songbird|thunderbird)\/([^ ]+)(.*)$/.match(@ua_string)
      if !@known && match
        @known = true
        @name = match[5].to_sym
        @name = :netscape if @name == :netscape6
        @render_engine = :gecko
        inner_part = match[1]
        @render_engine_version = match[2]
        distry_part = match[3]
        @version = match[6]
        after_part = match[7]
      end
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
    !@bot && !@feed_reader && !@other
  end

  # Returns the complete user agent version, as given by the user agent
  def complete_version
    @version
  end

  # Returns an Array of all available .NET-Versions.
  def dotnet_versions
    raise NotImplementedError
  end

  # Some bots provide on or more contact email addresses. This method will
  # return the first identified address as a String or nil, if no address could
  # be identified.
  def email
    @emails.first
  end

  # Some bots provide one or more contact email addresses. This method will 
  # return all identified addresses as an Array. It'll empty, if no addresses
  # could be identified
  def emails
    @emails
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

  # Returns true, if the user agent is neighter a browser, bot or feed reader.
  # Examples: SVN Client, Apache-Browser
  def other?
    @other
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
  
  # Some bots provide on or more urls. This method will return the first 
  # identified url as a String or nil, if no url could be identified.
  def url
    @urls.first
  end

  # Some bots provide one or more urls. This method will return all identified
  # urls as an Array. It'll empty, if no urls could be identified.
  def urls
    @urls
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
    defs = {:two => {:browsers => [:bonecho, :camino, :flock, :firefox,
          :granparadiso, :"k-meleon", :minefield, :netscape, :phoenix,
          :seamonkey], :regexp => /^([0-9]+\.[0-9][ab]?)/}}
    defs.each_key do |key|
      if defs[key][:browsers].include?(@name)
        v = defs[key][:regexp].match(@version)
        return v[1] if v
      end
    end

    case @name
    when :navigator # major.minor till navigator 4.0, major afterwards
      return (@version =~ /^[0-4]/) ? /^([0-9]+\.[0-9]+)\./.match(@version)[1] : /^([0-9]+)\./.match(@version)[1]
    end
    return @version
  end
end
