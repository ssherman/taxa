# frozen_string_literal: true

module Taxa
  module OpenTreeOfLife
    # helper module to get label format from parameters
    module LabelFormatHelper
      SUBTREE_LABEL_FORMATS = %w[name id name_and_id].freeze

      def get_label_format(format, **parameters)
        if format == 'newick'
          label_format = parameters[:label_format] || 'name_and_id'
          unless SUBTREE_LABEL_FORMATS.include?(label_format)
            raise ArgumentError, "label_format be one of the following #{SUBTREE_LABEL_FORMATS.join(', ')}"
          end

          return label_format
        end
        nil
      end
    end
  end
end
