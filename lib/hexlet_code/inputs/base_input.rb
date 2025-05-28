# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput
      attr_reader :element

      def initialize(element)
        @element = element
      end

      def render_label
        return '' unless element[:label]

        Tag.build('label', for: element[:name]) { element[:label][:text] }
      end

      def render
        raise NotImplementedError
      end
    end
  end
end
