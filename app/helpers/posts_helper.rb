module PostsHelper
	def new_url(id)
		 "http://#{request.host_with_port}/#{id}"
	end
	
	def get_countries(id)
		country_list=TrackUrl.where("post_id=?",id).pluck(:location)
		country_list.uniq.join(', ')
	end
end
