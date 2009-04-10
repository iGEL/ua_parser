module UaParser
  class UserAgent
    # Creates a new UserAgent object.
    #
    # == Parameters
    # * ua_string: The user agent as you got it
    def initialize(ua_string)
      ua_string = "" unless ua_string.is_a?(String)
      @ua_string = ua_string.strip.downcase
      @known = false
      @type = :browser
      @name = :unknown_browser
      @urls = []
      @emails = []
      @dot_net_versions = []
      @regexps = 0
      @details = []

      if @ua_string == "" || @ua_string == "-"
        @name = :no_agent_given
        return
      end

      # Identify Operas pretending to be an Internet Explorer
      unless @known
        match = /^mozilla\/4\.0 \(compatible; msie [4-6].0;(.*)\) opera ([0-9]+\.[0-9]+)(.*)$/.match(@ua_string)
        @regexps += 1
        if match
          @known = true
          @name = :opera
          @render_engine = :presto
          @version = match[2]
          @details = match[1].split(/;\s?/) + match[3].split(/\s/)
        end
      end

      # Identify Internet Explorers
      unless @known
        match = /^mozilla\/4.0 \(compatible; msie ([0-9]\.[0-9]); ([^)]+)\)(.*)$/.match(@ua_string)
        @regexps += 1
        if match
          @known = true
          @name = :internet_explorer
          @render_engine = :trident
          @version = match[1]
          @details = match[2].split(/;\s?/) + match[3].split(/\s/)
        end
      end

      # Identify Opera pretending to be a Firefox
      unless @known
        match = /\Amozilla\/5.0 \((.+) rv:[0-9.]+\) gecko\/[0-9]+ firefox\/[0-9.]+ opera ([0-9]+\.[0-9]+)(.*)\Z/.match(@ua_string)
        @regexps += 1
        if match
          @known = true
          @name = :opera
          @render_engine = :presto
          @version = match[2]
          @details = match[1].split(/;\s?/) + match[3].split(/\s/)
        end
      end

      # Flock and some versions of the Netscape Navigator try to identify themself
      # also as a Firefox, so we have to identify them first.
      unless @known
        match = /^mozilla\/5\.0 \(([^)]+); rv:([^; )]+)\) gecko\/20[0-2][0-9][01][0-9][0-3][0-9][0-9]* firefox\/[^ ]+ (flock|navigator)\/([^ ]+)(.*)$/.match(@ua_string)
        @regexps += 1
        if match
          @known = true
          @name = match[3].to_sym
          @render_engine = :gecko
          @details = match[1].split(/;\s?/) + match[5].split(/\s/)
          @render_engine_version = match[2]
          @version = match[4]
        end
      end

      # Identify all other gecko based browsers except the orginal mozilla
      unless @known
        match = /\Amozilla\/5\.0 \((.+); rv:([^; )]+)\) gecko\/20[0-2][0-9][01][0-9][0-3][0-9][0-9]*( [^ ]+)?( \([^)]+\))? (bonecho|camino|epiphany|firefox|granparadiso|iceweasel|k-meleon|minefield|netscape6?|phoenix|seamonkey|songbird|thunderbird)\/([^ ]+)(.*)\Z/.match(@ua_string)
        @regexps += 1
        if match
          @known = true
          @name = match[5].to_sym
          @name = :netscape if @name == :netscape6
          @render_engine = :gecko
          @details = match[1].split(/;\s?/) + "#{match[3]} #{match[7]}".split(/\s/)
          @render_engine_version = match[2]
          @version = match[6]
        end
      end

      # Identify the Googlebot, mj12bot and yahoo slurp
      unless @known
        match = /^mozilla\/5.0 \(compatible; (googlebot|mj12bot|yahoo! slurp)(\/v?([^)]+))?; \+?(http:\/\/[^)]+)\)$/.match(@ua_string)
        @regexps += 1
        if match
          @known = true
          @name = match[1].to_sym
          @type = :bot
          @urls << match[4]
          @version = match[3]
        end
      end

      # Identify the baiduspider, gigabot, mnsbot, msnbot-media, seekbot, speedy spider and naver yeti > 1.0
      unless @known
        match = /\A(baiduspider|gigabot|msnbot|msnbot-media|seekbot|speedy spider|yeti)(\/([^+ ]+))?[ +]\(.*(http:\/\/[^)]+)\)/.match(@ua_string)
        @regexps += 1
        if match
          @known = true
          @name = match[1].to_sym
          @type = :bot
          @urls << match[4]
          @version = match[3]
        end
      end

      unless @known
        match = /\A(mediapartners-google|googlebot-image)(\/([^ ]+))?\Z/.match(@ua_string)
        @regexps += 1
        if match
          @known = true
          @name = match[1].to_sym
          @type = :bot
          @version = match[3]
        end
      end

      # Identify Chrome
      unless @known
        match = /\Amozilla\/5\.0 \(([^)]+)\) applewebkit\/([0-9]+\.[0-9]+) \(khtml, like gecko\) chrome\/([0-9.]+) safari\/[0-9]+\.[0-9]+(.*)\Z/.match(@ua_string)
        @regexps += 1
        if match
          @known = true
          @name = :chrome
          @render_engine = :webkit
          @render_engine_version = match[2]
          @version = match[3]
          @details = match[1].split(/;\s?/) + match[4].split(/\s/)
        end
      end

      # Identify Safari >= bersion 3
      unless @known
        match = /\Amozilla\/5.0 \(([^)]+)\) applewebkit\/([^ ]+) \(khtml, like gecko\) version\/([^ ]+) safari\/[0-9]+\.[0-9]+(.*)\Z/.match(@ua_string)
        @regexps += 1
        if match
          @known = true
          @name = :safari
          @render_engine = :webkit
          @render_engine_version = match[2]
          @version = match[3]
          @details = match[1].split(/;\s?/) + match[4].split(/\s/)
        end
      end

      # Identify twiceler (of cuil)
      unless @known
        match = /^mozilla\/5.0 \((twiceler)-([^ ]+) \+?(http:\/\/[^)]+)\)$/.match(@ua_string)
        @regexps += 1
        if match
          @known = true
          @name = match[1].to_sym
          @type = :bot
          @urls << match[3]
          @version = match[2]
        end
      end

      # Identify gonzo (of suchen.de)
      unless @known
        match = /\Agonzo([0-9]+)\[[a-z]\] \+([^ ]+)\Z/.match(@ua_string)
        @regexps += 1
        if match
          @known = true
          @name = :gonzo
          @type = :bot
          @version = match[1]
          @urls << match[2]
        end
      end

      # Identify the yeti 0.01
      unless @known
        match = /\Ayeti\/([^ ]+) \(nhn\/1noon, yetibot@naver.com, check robots.txt daily and follow it\)\Z/.match(@ua_string)
        @regexps += 1
        if match
          @known = true
          @name = :yeti
          @type = :bot
          @emails << "yetibot@naver.com"
          @version = match[1]
        end
      end
=begin
Disabled, since we cannot identify the browser versions. If you know a table
with all released versions of safari with the used webkit versions, please
report it!


    # Identify Safari < version 3
    unless @known
      match = /\Amozilla\/5\.0 \((.+)\) applewebkit\/([^ ]+) \(khtml, like gecko\) safari\/([^ ]+)(.*)\Z/.match(@ua_string)
      @regexps += 1
        if match
        @known = true
        @name = :safari
        @render_engine = :webkit
        @render_engine_version = match[2]
        @version = match[3]
        ua_info = "#{match[1]} #{match[4]}"
      end
    end
=end

      # Identify now Operas, which do not try to pretend another browser
      unless @known
        match = /\Aopera\/([0-9]+\.[0-9]+) \(([^)]+)\) ?(presto\/([0-9.]+))?(.*)\Z/.match(@ua_string)
        @regexps += 1
        if match
          @known = true
          @name = :opera
          @version = match[1]
          @render_engine = :presto
          @render_engine_version = match[4]
          @details = match[2].split(/;\s?/) + match[5].split(/\s/)
        end
      end

      # Identify rarely used agents
      unless @known
        match = /veoh-\\xe2\\xb8\\xb3\\xe2\\xb8\\xb40 service \([^)]\)/.match(@ua_string)
        @regexps += 1
        if match
          @known = true
          @name = :veoh_service
          @type = :other
          @details = match[1].split(/;\s?/)
        end

        # Identfity tortoise svn
        unless @known
          match = /\Asvn\/[^ ]+ \(r[0-9]+\)\/tortoisesvn-([^ ]+)/.match(@ua_string)
          @regexps += 1
          if match
            @known = true
            @name = :tortoisesvn
            @type = :other
            @version = match[1]
          end
        end

        # Identify other http agents
        unless @known
          match = /\Asvn\/([^ ]+) \(r[0-9]+\)/.match(@ua_string)
          @regexps += 1
          if match
            @known = true
            @name = :svn_client
            @type = :other
            @version = match[1]
          end
        end

        # Identify libwww-perl
        unless @known
          match = /\Alibwww-perl\/([^ ]+)\Z/.match(@ua_string)
          @regexps += 1
          if match
            @known = true
            @type = :other
            @name = :"libwww-perl"
            @version = match[1]
          end
        end

        # Identify Jakarta Commons HttpClient libary
        unless @known
          match = /\Ajakarta commons-httpclient\/([^ ]+)\Z/.match(@ua_string)
          @regexps += 1
          if match
            @known = true
            @type = :other
            @name = :jakarta_commons_httpclient
            @version = match[1]
          end
        end

        unless @known
          match = /\Ajava\/([^ ]+)\Z/.match(@ua_string)
          @regexps += 1
          if match
            @known = true
            @type = :other
            @name = :java
            @version = match[1]
          end
        end
        
        # Identify connections from the Apache httpd.
        unless @known
          match = /\Aapache\/([^ ]+)/.match(@ua_string)
          @regexps += 1
          if match
            @known = true
            @name = :apache_httpd
            @version = match[1]
            @type = :other
          end
        end
      end

      # Still not known? Try to guess
      unless @known
        if @ua_string =~ /bot|spider|crawler/
          @regexps += 1
          @type = :bot
          @name = :unknown_bot
        elsif @ua_string =~ /feed|rss|atom/
          @regexps += 2
          @type = :feed_reader
          @name = :unknown_feed_reader
        end
        @urls = @ua_string.scan(/(((f|ht)tps?:\/\/|www\.)[a-z0-9.-]+(:[0-9]+)?(\/([a-z0-9.\-_+\/%?=;,&]*[a-z0-9.\-_+\/%?=,&])?)?)/).collect { |url| url.first }
        @emails = @ua_string.scan(/([0-9a-z]([0-9a-z_\-.]*[0-9a-z])?@[0-9a-z.-]+)/).collect { |mail| mail.first}
      end
    end

    # Returns the architecture as a lower case symbol like :i686 or :ppc
    def architecture
      raise NotImplementedError
    end
  
    # Returns true, if the user agent is suspected or known to be a bot.
    def bot?
      @type == :bot
    end

    # Returns true, if the user agent is known or suspected to be a browser.
    # Completely unknown user agents are also suspected browsers. Check known?,
    # if you want to make sure the browser is known.
    def browser?
      @type == :browser
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
      @type == :feed_reader
    end

    # Returns true, if the user agent is a tool to grab the contents of a
    # webpage like wget
    def grapper?
      @type == :grabber
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
    # Examples: SVN Client, Apache-Browser, libaries like libwww-perl
    def other?
      @type == :other
    end

    # Returns the number of regexps, which were executed to identify this agent.
    # Regexps for identifications of versions are not counted.
    def regexps
      @regexps
    end

    # Returns the name of the render engine as a string if known, otherwise nil.
    def render_engine
      @render_engine
    end

    # Returns a UaParser::Version object with the version of the render engine
    # if known, otherwise nil
    def render_engine_version
      parse_details if @render_engine == :trident
      return nil if @render_engine_version.nil?
      @render_engine_version_object = Version.new(@render_engine_version, @render_engine) if @render_engine_version_object.nil?
      @render_engine_version_object
    end

    # Returns the type of the user agent as a Symbol. Returns :browser, if the
    # user agent coundn't be recognized, since this seems the savest choice. Use
    # #known? if you want to know, if the user agent could be recognized.
    def type
      @type
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

    # Returns a UaAgent::Version object with the Version number
    def version
      return nil if @version.nil?
      @version_object = Version.new(@version, @name) if @version_object.nil?
      @version_object
    end

    private
    def parse_details
      if !@details_parsed && !@details.empty?
        if @render_engine == :trident
          @details.each do |info|
            match = /trident\/(.+)/.match(info)
            @regexps += 1
            @render_engine_version = match[1] if match
          end
        end
        @details_parsed = true
      end
    end
  end
end