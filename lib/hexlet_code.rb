# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :FormBuilder, 'hexlet_code/form_builder'
  autoload :HtmlRenderer, 'hexlet_code/html_renderer'

  def self.form_for(entity, url: '#', **attributes)
    form_builder = FormBuilder.new(entity)
    yield(form_builder) if block_given?

    renderer = HtmlRenderer.new
    form_content = renderer.render(form_builder.elements)

    Tag.build('form', { action: url, method: 'post' }.merge(attributes)) { form_content }
  end
end
