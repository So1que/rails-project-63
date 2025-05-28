# frozen_string_literal: true

module HexletCode
  module Inputs
    class SubmitInput < BaseInput
      def render
        result = render_label
        attrs = { type: 'submit', value: element[:value] }
                .merge(element[:attributes])
        result += Tag.build('input', attrs)
        result
      end
    end
  end
end
