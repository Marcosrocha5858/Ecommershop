defmodule Ecommerceshop.ProdutoModel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "produtos" do
    field :admin_id, :integer
    field :name, :string
    field :valor, :integer

    timestamps()
  end

  @doc false
  def changeset(produto, attrs) do
    produto
    |> cast(attrs, [:name, :valor, :admin_id])
    |> validate_required([:name, :valor, :admin_id])
  end
end
