defmodule ProjectElixir.Router do
	use ProjectElixir.Web, :router

	pipeline :browser do
		plug :accepts, ["html"]
		plug :fetch_session
		plug :fetch_flash
		plug :protect_from_forgery
		plug :put_secure_browser_headers
	end

	pipeline :api do
		plug :accepts, ["json"]
	end

	scope "/api/v1", ProjectElixir do
		pipe_through :api
		resources "/users", UserController
	end

	# Other scopes may use custom stacks.
	# scope "/api", ProjectElixir do
	#   pipe_through :api
	# end
end
