# frozen_string_literal: true

require 'faraday'
require 'json'

module Taxa
  class OpenTreeOfLife
    class TNRS
      # tnrs match_names api endpoint
      module MatchNames
        def match_names(**parameters)
          names = parameters[:names]
          raise ArgumentError if names.nil?

          context_name = parameters[:context_name]
          do_approximate_matching = parameters[:do_approximate_matching] || false
          include_suppressed = parameters[:include_suppressed]

          payload = generate_payload(names, context_name, do_approximate_matching, include_suppressed)
          url = 'https://api.opentreeoflife.org/v3/tnrs/match_names'
          response = Faraday.post(url, JSON.generate(payload), 'Content-Type' => 'application/json')
          JSON.parse(response.body)
        end
      end
    end
  end
end

def generate_payload(names, context_name, do_approximate_matching, include_suppressed)
  {
    names: names,
    context_name: context_name,
    do_approximate_matching: do_approximate_matching,
    include_suppressed: include_suppressed
  }.compact
end
