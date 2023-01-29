# frozen_string_literal: true

require_relative "fuck_off/version"

module FuckOff
  Error = Module.new
  NameError = Class.new(NameError) { include Error }
  NoMethodError = Class.new(NoMethodError) { include Error }

  module ClassMethods
    def fucking_private_methods
      if defined? @fucking_private_methods
        @fucking_private_methods
      elsif superclass.respond_to? :fucking_private_methods
        @fucking_private_methods = superclass.fucking_private_methods
      else
        @fucking_private_methods = {}
      end
    end

    def fucking_final_methods
      if defined? @fucking_final_methods
        @fucking_final_methods
      elsif superclass.respond_to? :fucking_final_methods
        @fucking_final_methods = superclass.fucking_final_methods
      else
        @fucking_final_methods = {}
      end
    end

    def fucking_private(method_name)
      fucking_private_methods[method_name] = true
      private method_name
      method_name
    end

    def fucking_final(method_name)
      fucking_final_methods[method_name] = true
      method_name
    end

    def method_added(method_name)
      if fucking_final_methods[method_name]
        raise FuckOff::NameError, "Fuck you!"
      else
        super
      end
    end
  end

  def self.included(klass)
    klass.extend(ClassMethods)
  end

  def send(name, *args, **kwargs, &block)
    if self.class.fucking_private_methods[name]
      raise FuckOff::NoMethodError, "Fuck off!"
    else
      super
    end
  end
end
