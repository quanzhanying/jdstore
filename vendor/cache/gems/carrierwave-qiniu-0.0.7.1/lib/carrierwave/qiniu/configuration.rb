# encoding: utf-8

module CarrierWave
  module Qiniu
    module Configuration
      extend ActiveSupport::Concern
      included do
        add_config :qiniu_bucket_domain
        add_config :qiniu_bucket
        add_config :qiniu_access_key
        add_config :qiniu_secret_key
        add_config :qiniu_block_size
        add_config :qiniu_protocal
      end
    end

    module ClassMethods
      def add_config(name)
          class_eval <<-RUBY, __FILE__, __LINE__ + 1
            def self.#{name}(value=nil)
              @#{name} = value if value
              return @#{name} if self.object_id == #{self.object_id} || defined?(@#{name})
              name = superclass.#{name}
              return nil if name.nil? && !instance_variable_defined?("@#{name}")
              @#{name} = name && !name.is_a?(Module) && !name.is_a?(Symbol) && !name.is_a?(Numeric) && !name.is_a?(TrueClass) && !name.is_a?(FalseClass) ? name.dup : name
            end

            def self.#{name}=(value)
              @#{name} = value
            end

            def #{name}
              value = self.class.#{name}
              value.instance_of?(Proc) ? value.call : value
            end
          RUBY
        end
    end
  end
end
