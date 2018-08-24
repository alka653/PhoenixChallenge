defmodule ProjectElixir.UserController do
	use ProjectElixir.Web, :controller

	alias ProjectElixir.User

	def index(conn, _params) do
		users = Repo.all(User)
		json conn, %{"data" => users}
	end

	def show(conn, %{"id" => id}) do
		user = Repo.get(User, id)
		json conn, user
	end

	def create(conn, %{"user" => user_params}) do
		changeset = User.changeset(%User{}, user_params)

		case Repo.insert(changeset) do
			{:ok, _user} ->
				json conn, %{"response" => "User created successfully"}
			{:error, changeset} ->
				json conn, %{"response" => "An error has ocurred", "dataset" => changeset}
		end
	end

	def update(conn, %{"id" => id, "user" => user_params}) do
		user = Repo.get!(User, id)
		changeset = User.changeset(user, user_params)

		case Repo.update(changeset) do
			{:ok, user} ->
				json conn, %{"response" => "User updated successfully."}
			{:error, changeset} ->
				json conn, %{"response" => "An error has ocurred", "dataset" => changeset}
		end
	end

end
