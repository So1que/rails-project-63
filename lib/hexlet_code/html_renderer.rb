# frozen_string_literal: true

module HexletCode
  class HtmlRenderer
    def render(elements)
      elements.map { |element| render_element(element) }.join
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
        attrs = {
          type: 'submit',
          value: element[:value]
        }.merge(element[:attributes])
        Tag.build('input', attrs)
      end
    end
  end
end
