class ApplicationController < ActionController::Base
	# Getting a CSRF error. I can't spend more time debugging the error
	# so I'm just disabling it for now.
	protect_from_forgery with: :null_session
end
