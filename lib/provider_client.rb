module RubyOuath
  class ProviderClient
    def self.redirect_uri(state)
      params = {
        client_id: RubyOuath.configuration.client_id,
        redirect_uri: RubyOuath.configuration.callback_url,
        state: state
      }
      uri = URI('https://www.facebook.com/v15.0/dialog/oauth')
      uri.query = URI.encode_www_form(params)

      uri
    end

    def self.get_token_by_code(code)
      params = {
        code: code,
        redirect_uri: RubyOuath.configuration.callback_url,
        client_id: RubyOuath.configuration.client_id,
        client_secret: RubyOuath.configuration.client_secret
      }

      uri = URI('https://graph.facebook.com/v15.0/oauth/access_token')
      uri.query = URI.encode_www_form(params)

      res = RestClient.get(uri.to_s)

      result = JSON.parse(res.body)
    end
  end
end