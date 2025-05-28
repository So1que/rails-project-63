# frozen_string_literal: true

module HexletCode
  module Inputs
    class TextInput < BaseInput
      def render
        result = render_label
        attrs = { name: element[:name], cols: 20, rows: 40 }
                .merge(element[:attributes])
        result += Tag.build('textarea', attrs) { element[:value].to_s }
        result
      end
    end
  end
end
