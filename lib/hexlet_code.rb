# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end

  autoload :Tag, "hexlet_code/tag"

  def self.form_for(_entity, **attributes)
    url = attributes.delete(:url) || "#"
    form_attributes = { action: url, method: "post" }.merge(attributes)

    Tag.build("form", form_attributes)
  end
end
