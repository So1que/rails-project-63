# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :entity, :inputs_html

    def initialize(entity)
      @entity = entity
      @inputs_html = ""
    end

    def input(name, **attributes)
      begin
        value = @entity.public_send(name)
      rescue NoMethodError
        raise NoMethodError, "undefined method `#{name}' for #{@entity}"
      end

      input_type = attributes.delete(:as)

      if input_type == :text
        generate_textarea(name, value, attributes)
      else
        generate_text_input(name, value, attributes)
      end
    end

    private

    def generate_text_input(name, value, attributes)
      attrs = { name: name.to_s, type: "text", value: value.to_s }.merge(attributes)
      @inputs_html += Tag.build("input", attrs)
    end

    def generate_textarea(name, value, attributes)
      attrs = { name: name.to_s, cols: 20, rows: 40 }.merge(attributes)
      @inputs_html += Tag.build("textarea", attrs) { value.to_s }
    end
  end
end
