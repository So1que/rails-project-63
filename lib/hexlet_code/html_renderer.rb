# frozen_string_literal: true

module HexletCode
  class HtmlRenderer
    def render_form(elements, url, attributes)
      form_content = render(elements)
      Tag.build('form', { action: url, method: 'post' }.merge(attributes)) { form_content }
    end

    def render(elements)
      elements.map { |element| render_element(element) }.join
    end

    private

    def render_element(element)
      type = element[:type] || :input
      klass = HexletCode::Inputs.const_get("#{type.to_s.capitalize}Input")
      input = klass.new(element)
      input.render
    end
  end
end
