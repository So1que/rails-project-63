# frozen_string_literal: true

module HexletCode
  module Tag
    SINGLE_TAGS = %w[br img input].freeze

    def self.build(tag_name, attributes = {})
      attributes_string = build_attributes_string(attributes)

      if SINGLE_TAGS.include?(tag_name)
        "<#{tag_name}#{attributes_string}>"
      else
        content = block_given? ? yield : ''
        "<#{tag_name}#{attributes_string}>#{content}</#{tag_name}>"
      end
    end

    def self.build_attributes_string(attributes)
      return '' if attributes.empty?

      attrs = attributes.map do |key, value|
        "#{key}='#{value}'"
      end

      " #{attrs.join(' ')}"
    end
  end
end
