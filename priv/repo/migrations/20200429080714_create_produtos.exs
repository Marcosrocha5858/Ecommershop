defmodule Ecommerceshop.Repo.Migrations.CreateProdutos do
  use Ecto.Migration

  def change do
    create table(:produtos) do
      add :name, :string
      add :valor, :integer
      add :admin_id, :integer

      timestamps()
    end

  end
end
