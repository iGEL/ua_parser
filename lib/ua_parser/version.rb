module UaParser
  # This class stores the version number for comparison and printing out the
  # major version
  class Version
    include Comparable
    
    attr_reader :name

    class DifferentAgentsNotComparable < RuntimeError
    end

    # Initializes a new Version object with the given version number (you should
    # pass it as a String). Optional you may pass a user agent name as a Symbol,
    # which allows #major to print out the version number in the common way.
    def initialize(version, name = nil)
      version = version.to_s if version.is_a?(Integer) || version.is_a?(Float)
      raise TypeError, "version must be a String, Integer or Float, but was a #{version.class}" unless version.is_a?(String)
      @tokens = version.split(/(\.|_|[a-z]+)/)
      @tokens.delete_if { |t| t == "." || t == "_" }
      insert_zeros_before = []
      @tokens.each_index do |i|
        if @tokens[i] =~ /\A[0-9]+\Z/
          while @tokens[i] =~ /\A0[0-9]/ # Remember zeros, but chop them of for now
            insert_zeros_before << i
            @tokens[i] = @tokens[i][1..-1]
          end
          @tokens[i] = @tokens[i].to_i
        end
      end
      insert_zeros_before.each do |i| # Insert zeros again
        @tokens.insert(i, 0)
      end
      @version = version
      @name = name
    end

    # Returns -1, if the given version is smaller than the current one, 0 if
    # they are equal and 1 if the current version is bigger. Used by Comparable
    # to provide funktions like <, >= or between?
    def <=>(other)
      raise TypeError unless other.is_a?(Version)
      raise DifferentAgentsNotComparable, "Cannot compare #{@name} and #{other.name}" unless @name == other.name
      i_sort(other)
    end

    # Returns the whole version number, as given by the by the user agent.
    def full
      @version
    end

    # Returns the major version, e.g. "3.0", "2.0b" or "1.5" for Firefox,
    # "9.6" for Opera or "7.0" or "5.5" for Internet Explorer
    def major
      if @name == :opera || (@name == :netscape && self >= Version.new(5, :netscape))
        return "#{@tokens[0]}.#{@tokens[1].to_s[0...1]}"
      elsif [:internet_explorer, :navigator].include?(@name) && @tokens[1] == 0
        return "#{@tokens[0]}"
      elsif @tokens.size == 1
        return "#{@tokens[0]}"
      elsif @tokens[2].is_a?(String)
        return "#{@tokens[0]}.#{@tokens[1]}#{@tokens[2]}"
      else
        return "#{@tokens[0]}.#{@tokens[1]}"
      end
    end
    
    protected
    # Required by i_sort
    def tokens
      @tokens
    end

    private
    # Used to recursively compare the version numbers
    def i_sort(other, deep = 0)
      return 0 if @tokens[deep].nil? && other.tokens[deep].nil?
      my_token = @tokens[deep] || 0
      other_token = other.tokens[deep] || 0
      return 1 if my_token.is_a?(Integer) && other_token.is_a?(String)
      return -1 if my_token.is_a?(String) && other_token.is_a?(Integer)
      return i_sort(other, deep + 1) if my_token == other_token
      return my_token <=> other_token
    end
  end
end
