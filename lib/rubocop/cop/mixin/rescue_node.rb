# frozen_string_literal: true

module RuboCop
  module Cop
    # Common functionality for checking `rescue` nodes.
    module RescueNode
      def on_new_investigation
        @modifier_locations = processed_source
                              .tokens
                              .select(&:rescue_modifier?)
                              .map(&:pos)
      end

      private

      def rescue_modifier?(node)
        node&.resbody_type? &&
          @modifier_locations.include?(node.loc.keyword)
      end
    end
  end
end
