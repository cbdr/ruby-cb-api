require 'json'

module Cb
  module ResponseValidator

    def self.validate(response)
      if response.blank? || response.response.body.blank?
        return false
      end

      if response.code != 200
        return false
      end

      begin
        json = JSON.parse(response.response.body)
        if json.keys.any?
          return true
        end
      rescue JSON::ParserError
        return false
      end

      return true

    end
  end
end