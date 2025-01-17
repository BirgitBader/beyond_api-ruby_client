require "beyond_api/version"

require "beyond_api/connection"
require "beyond_api/request"
require "beyond_api/session"

require "beyond_api/ext"
require "beyond_api/utils"

module BeyondApi
  class Error < StandardError; end

  class << self
    attr_accessor :configuration
  end

  def self.setup
    self.configuration ||= Configuration.new

    yield configuration
  end

  class Configuration
    attr_accessor :client_id, :client_secret, :open_timeout, :timeout,  :remove_response_links,
                  :remove_response_key_underscores, :object_struct_responses

    def initialize
      @client_id = nil
      @client_secret = nil
      @open_timeout = 2
      @timeout = 5
      @remove_response_links = false
      @remove_response_key_underscores = false
      @object_struct_responses = false
    end
  end
end
