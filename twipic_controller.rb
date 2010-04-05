require 'net/http'
require 'json'
require 'uri'

# API for retrieving twitter profile images
#
# http://localhost/normal/screen_name
# http://localhost/bigger/screen_name
# http://localhost/full/screen_name

class TwipicController < ApplicationController
	def retrieve
		profile_image_url = "/404.html"

		if params[:size] != nil && params[:id] != nil
			resource = Net::HTTP.new("api.twitter.com",80)
			headers,data = resource.get('/1/users/show/' + params[:id] + '.json')

			tmp_url = JSON.parse(data)['profile_image_url']

			if tmp_url != nil
				case params[:size]
				when "normal"
					profile_image_url = tmp_url
				when "bigger"
					profile_image_url = tmp_url
					profile_image_url["_normal"] = "_bigger"
				when "full"
					profile_image_url = tmp_url
					profile_image_url["_normal"] = ""
				end
			end
		end

		redirect_to(profile_image_url)
	end
end
