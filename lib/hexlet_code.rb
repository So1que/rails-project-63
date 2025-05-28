# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :FormBuilder, 'hexlet_code/form_builder'
  autoload :HtmlRenderer, 'hexlet_code/html_renderer'

  module Inputs
    autoload :BaseInput, 'hexlet_code/inputs/base_input'
    autoload :InputInput, 'hexlet_code/inputs/input_input'
    autoload :TextInput, 'hexlet_code/inputs/text_input'
    autoload :SubmitInput, 'hexlet_code/inputs/submit_input'
  end

  @renderer_class = HtmlRenderer

  class << self
    attr_accessor :renderer_class

    def form_for(entity, url: '#', **attributes)
      form_builder = FormBuilder.new(entity)
      yield(form_builder) if block_given?

      renderer = @renderer_class.new

      renderer.render_form(form_builder.elements, url, attributes)
    end
  end
end
