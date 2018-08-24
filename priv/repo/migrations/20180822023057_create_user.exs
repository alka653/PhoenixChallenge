defmodule ProjectElixir.Repo.Migrations.CreateUser do
	use Ecto.Migration

	def change do
		create table(:users) do
			add :name, :string
			add :email, :string
			add :password, :string
			add :verify, :boolean, default: false
			add :telephone, :string
			add :country, :string
			add :city, :string
			add :direction, :string
			timestamps
		end
		create unique_index(:users, [:email])
	end

end
