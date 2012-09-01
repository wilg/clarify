module VideosHelper

	def render_video(video, options = {})
		default_options = {:width => 800, :height => 450}
		options.merge!(default_options)
		if !video.youtube_id.blank?
			render_youtube_video(video.youtube_id, options).html_safe
		elsif !video.vimeo_id.blank?
			render_vimeo_video(video.vimeo_id, options).html_safe
		end
	end

	def render_youtube_video(youtube_id, options = {})
			youtube_options = options.delete(:youtube) || {}
			youtube_url = youtube_embed_url({id: youtube_id, iv_load_policy: 3, showinfo: 0, rel: 0}.merge(youtube_options))
			options = {
					allowfullscreen: true,
					frameborder: 0,
					src: youtube_url,
					width: 580,
					height: 327,
					class: "youtube-video"
				}.merge(options)
			content_tag(:iframe, "", options)
	end

	def render_vimeo_video(vimeo_id, options = {})
			vimeo_options = options.delete(:vimeo) || {}
			vimeo_url = vimeo_embed_url({id: vimeo_id, title: 0, byline: 0, portrait: 0}.merge(vimeo_options))
			options = {
					allowFullScreen: true,
					webkitAllowFullScreen: true,
					mozAllowFullScreen: true,
					frameborder: 0,
					src: vimeo_url,
					width: 560,
					height: 315,
					class: "vimeo-video"
				}.merge(options)
			content_tag(:iframe, "", options)
	end

end
