class GoogleController < ApplicationController
  def fetch
    access_token = params['access_token']
    client = Google::APIClient.new(:application_name => GOOGLE_APPLICATION_NAME,
                                   :application_version => '0.1')
    client.authorization.access_token = access_token
    oauth2 = client.discovered_api('oauth2')
    result = client.execute(:api_method => oauth2.userinfo.get)

    if result.body
      email = ActiveSupport::JSON.decode(result.body)['email']
      u = User.where(:email=>email).first
      if u
        status = "verified"
      else
        status = "unverified"
      end
    else
      status = "unverified"
    end
    r = {}
    r['status'] = status

    render json: r
  end
end
