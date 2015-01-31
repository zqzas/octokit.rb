module Octokit
  class Client

    # Methods for the languages API
    #
    module Languages

      LANGUAGES_PREVIEW_MEDIA_TYPE = "application/vnd.github.cypher-preview".freeze

      # List all languages
      #
      # @return [Array<Sawyer::Resource>] A list of languages
      # @example
      #   Octokit.list_languages
      def list_languages(options = {})
        options = ensure_deployments_api_media_type(options)
        get "languages", options
      end

      def ensure_deployments_api_media_type(options = {})
        if options[:accept].nil?
          options[:accept] = LANGUAGES_PREVIEW_MEDIA_TYPE
          warn_deployments_preview
        end

        options
      end

      def warn_deployments_preview
        warn <<-EOS
WARNING: The preview version of the Deployments API is not yet suitable for production use.
You can avoid this message by supplying an appropriate media type in the 'Accept' request
header. 
EOS
      end  
    end
  end
end
