defmodule ProjectElixir.User do
	use ProjectElixir.Web, :model

	schema "users" do
		field :name, :string
		field :email, :string
		field :password, :string
		field :verify, :boolean, default: false
		field :telephone, :string
		field :country, :string
		field :city, :string
		field :direction, :string

		timestamps()
	end

	def changeset(struct, params \\ %{}) do
		struct
		|> cast(params, [:name, :email, :password, :verify, :telephone, :country, :city, :direction])
		|> validate_required([:name, :email, :password, :verify, :telephone, :country, :city, :direction])
		|> put_password_hash()
	end

	defp put_password_hash(
			%Ecto.Changeset{
				valid?: true, changes: %{password: password}
			} = changeset
		) do
		change(changeset, password: Bcrypt.hash_pwd_salt(password))
	end

	defp put_password_hash(changeset) do
		changeset
	end

end
