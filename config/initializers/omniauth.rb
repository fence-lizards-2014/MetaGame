# Intializes OmniAuth with API key
Rails.application.config.middleware.use OmniAuth::Builder do
	provider :steam, ENV["2CA9866DD532D38F34B6B2CBBD968E92"]
end

