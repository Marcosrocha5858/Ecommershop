defmodule Ecommerceshop.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :password, :integer
      add :email, :string

      timestamps()
    end

  end
end
