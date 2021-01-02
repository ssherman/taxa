# frozen_string_literal: true

require 'json'

module Taxa
  module OpenTreeOfLife
    class TNRS
      # tnrs match_names api endpoint
      module MatchNames
        def match_names(names, **parameters)
          raise ArgumentError, 'names is required' if names.nil?

          context_name = parameters[:context_name]
          do_approximate_matching = parameters[:do_approximate_matching] || false
          include_suppressed = parameters[:include_suppressed]

          payload = {
            names: Array(names),
            context_name: context_name,
            do_approximate_matching: do_approximate_matching,
            include_suppressed: include_suppressed
          }.compact

          url = 'https://api.opentreeoflife.org/v3/tnrs/match_names'
          response = @http_client.post(url, JSON.generate(payload), 'Content-Type' => 'application/json')
          JSON.parse(response.body)
        end
      end
    end
  end
end
