module OAuth2
  module Strategy
    class Refresh < Base
      # The Refresh Token Authorization Strategy
      def authorize_url
        fail(NotImplementedError, 'The authorization endpoint is not used in this strategy')
      end

      # Retrieve a refreshed token given the old token and its refresh token.
      # @param [String] token the old token to refresh
      # @param [String] refresh_token the refresh token of the old token
      # @param [String] params additional params
      # @return [OAuth2::AccessToken] the refreshed access token
      def get_token(token, refresh_token, params = {})
        OAuth2::AccessToken.new(@client, token, :refresh_token => refresh_token).refresh!(params)
      end
    end
  end
end
