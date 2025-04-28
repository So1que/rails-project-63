# frozen_string_literal: true

module HexletCode
  module Tag
    SINGLE_TAGS = %w[br img input].freeze

    def self.build(tag_name, attributes = {})
      attributes_string = build_attributes_string(attributes)

      return "<#{tag_name}#{attributes_string}>" if SINGLE_TAGS.include?(tag_name)

      content = block_given? ? yield : ''
      "<#{tag_name}#{attributes_string}>#{content}</#{tag_name}>"
    end

    def self.build_attributes_string(attributes)
      attrs = attributes.map do |key, value|
        " #{key}='#{value}'"
      end

      attrs.join
    end
  end
end
