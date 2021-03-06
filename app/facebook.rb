# frozen_string_literal: true
# https://developers.facebook.com/docs/graph-api/reference
# https://developers.facebook.com/docs/graph-api/changelog
# https://developers.facebook.com/docs/graph-api/changelog/breaking-changes

class FacebookError < HTTPError; end

class Facebook < HTTP
  BASE_URL = "https://graph.facebook.com/v2.12"
  PARAMS = "access_token=#{ENV["FACEBOOK_APP_ID"]}|#{ENV["FACEBOOK_APP_SECRET"]}"
  ERROR_CLASS = FacebookError
end

error FacebookError do |e|
  status 503
  "There was a problem talking to Facebook. Please try again in a moment."
end
