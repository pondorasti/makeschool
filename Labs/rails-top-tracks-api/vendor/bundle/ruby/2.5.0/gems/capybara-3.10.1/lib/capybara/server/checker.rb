# frozen_string_literal: true

module Capybara
  class Server
    class Checker
      TRY_HTTPS_ERRORS = [EOFError, Net::ReadTimeout, Errno::ECONNRESET].freeze

      def initialize(host, port)
        @host, @port = host, port
        @ssl = false
      end

      def request(&block)
        ssl? ? https_request(&block) : http_request(&block)
      rescue *TRY_HTTPS_ERRORS
        res = https_request(&block)
        @ssl = true
        res
      end

      def ssl?
        @ssl
      end

    private

      def http_request(&block)
        Net::HTTP.start(@host, @port, read_timeout: 2, &block)
      end

      def https_request(&block)
        Net::HTTP.start(@host, @port, ssl_options, &block)
      end

      def ssl_options
        { use_ssl: true, verify_mode: OpenSSL::SSL::VERIFY_NONE }
      end
    end
  end
end
