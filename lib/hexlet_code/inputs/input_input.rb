# frozen_string_literal: true

module HexletCode
  module Inputs
    class InputInput < BaseInput
      def render
        result = render_label
        attrs = { name: element[:name], type: 'text', value: element[:value].to_s }
                .merge(element[:attributes])
        result += Tag.build('input', attrs)
        result
      end
    end
  end
end
