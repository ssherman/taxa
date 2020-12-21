# frozen_string_literal: true

require 'faraday'
require 'json'

module Taxa
  module OpenTreeOfLife
    class TNRS
      # tnrs autocomplete_name api endpoint
      module AutocompleteName
        def autocomplete_name(**parameters)
          name = parameters[:name]
          raise ArgumentError if name.nil?

          context_name = parameters[:context_name]
          include_suppressed = parameters[:include_suppressed]

          payload = { name: name, context_name: context_name, include_suppressed: include_suppressed }.compact
          url = 'https://api.opentreeoflife.org/v3/tnrs/autocomplete_name'
          response = @http_client.post(url, JSON.generate(payload), 'Content-Type' => 'application/json')
          JSON.parse(response.body)
        end
      end
    end
  end
end
