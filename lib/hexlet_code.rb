# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end

  autoload :Tag, "hexlet_code/tag"
  autoload :FormBuilder, "hexlet_code/form_builder"

  def self.form_for(entity, **attributes)
    url = attributes.delete(:url) || "#"
    form_attributes = { action: url, method: "post" }.merge(attributes)

    builder = FormBuilder.new(entity)
    yield builder if block_given?

    Tag.build("form", form_attributes) do
      builder.inputs_html
    end
  end
end
