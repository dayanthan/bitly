module PostsHelper
	def new_url(id)
		 "http://#{request.host_with_port}/#{id}"
	end
end
