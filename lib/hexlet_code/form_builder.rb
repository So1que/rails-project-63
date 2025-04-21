# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :entity

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

      @elements << { type: :label, for: name.to_s, text: name.to_s.capitalize }

      element = {
        type: input_type || :input,
        name: name.to_s,
        value: value.to_s,
        attributes: attributes
      }

      @elements << element
    end

    def submit(value = 'Save')
      @elements << { type: :submit, value: value }
    end

    def inputs_html
      @elements.map { |element| render_element(element) }.join
    end

    private

    def render_element(element)
      case element[:type]
      when :label
        Tag.build('label', for: element[:for]) { element[:text] }
      when :input, nil
        attrs = {
          name: element[:name],
          type: 'text',
          value: element[:value]
        }.merge(element[:attributes])
        Tag.build('input', attrs)
      when :text
        attrs = {
          name: element[:name],
          cols: 20,
          rows: 40
        }.merge(element[:attributes])
        Tag.build('textarea', attrs) { element[:value] }
      when :submit
        Tag.build('input', type: 'submit', value: element[:value])
      end
    end
  end
end
