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
        render_label(element)
      when :input, nil
        render_input(element)
      when :text
        render_textarea(element)
      when :submit
        render_submit(element)
      end
    end

    def render_label(element)
      Tag.build('label', for: element[:for]) { element[:text] }
    end

    def render_input(element)
      attrs = { name: element[:name], type: 'text', value: element[:value] }
              .merge(element[:attributes])
      Tag.build('input', attrs)
    end

    def render_textarea(element)
      attrs = { name: element[:name], cols: 20, rows: 40 }
              .merge(element[:attributes])
      Tag.build('textarea', attrs) { element[:value].to_s }
    end

    def render_submit(element)
      attrs = { type: 'submit', value: element[:value] }
              .merge(element[:attributes])
      Tag.build('input', attrs)
    end
  end
end
