module VCAP::Services::Internal
  class Enum
    private

    # Define an enum constant as follows:
    # enum_for :key
    #  - Generates the constant KEY with value "KEY"
    def self.enum_for(key)
      const_set(key.upcase, key.upcase)
    end

    # Define an enum constant as follows:
    # enum_with_value_for :key, :value
    #  - Generates the constant KEY with value "value"
    def self.enum_with_value_for(key, value)
      const_set(key.upcase, value)
    end

    # Support helper method for is_key(k) function
    # returns true if k == KEY
    # Raises exception if the constant k is not defined
    def self.method_missing(m, *args)
      if m.to_s =~ /^is_(.+)$/
        role_sym = $1.upcase
        raise "#{self.class.name}::#{$1} undefined" unless self.const_defined?(role_sym)
        return const_get(role_sym) == args[0]
      end

      raise "#{self.class.name} does not define: #{m}"
    end

    # Return the string representation of the constant key
    def self.value_for(key)
      raise "Unknown: #{key}" unless self.const_defined?(key.to_sym)
      self.const_get(key.to_sym)
    end

    # Raises if an undefined enum constant is referenced
    def self.const_missing(key)
      raise "Unknown: #{key}"
    end

    # Enumerates all enum constants
    def self.all
      self.constants
    end

    # Enumerates all values of enum constants
    def self.all_values
      self.constants.map { |x| eval "self::#{x}.to_s" }
    end
  end
end
