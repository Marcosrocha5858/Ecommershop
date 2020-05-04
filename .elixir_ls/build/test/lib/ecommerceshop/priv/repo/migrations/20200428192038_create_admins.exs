defmodule Ecommerceshop.Repo.Migrations.CreateAdmins do
  use Ecto.Migration

  def change do
    create table(:admins) do
      add :name, :string
      add :password, :integer
      add :email, :string

      timestamps()
    end

  end
end
