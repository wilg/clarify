Clarify::Application.routes.draw do

	resources :episodes

	# Video Routes
	match "/embed/:id", as: :youtube_embed, host: "youtube.com", controller: :embed, action: :show
	match "/video/:id", as: :vimeo_embed, host: "player.vimeo.com", controller: :video, action: :show

	root :to => 'episodes#stream'

end
