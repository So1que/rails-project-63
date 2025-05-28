# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :entity, :elements

    def initialize(entity)
      @entity = entity
      @elements = []
    end

    def input(name, **attributes)
      begin
        value = @entity.public_send(name)
      rescue NoMethodError
        raise NoMethodError, "undefined method `#{name}' for #{@entity}"
      end

      input_type = attributes.delete(:as) || :input

      element = {
        type: input_type,
        name: name.to_s,
        value: value,
        attributes: attributes,
        label: { text: name.to_s.capitalize }
      }

      @elements << element
    end

    def submit(value = 'Save', **attributes)
      @elements << { type: :submit, value: value, attributes: attributes }
    end
  end
end
