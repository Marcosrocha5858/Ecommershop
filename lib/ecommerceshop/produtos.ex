defmodule Ecommerceshop.Produtos do
  @moduledoc """
  The Produtos context.
  """

  import Ecto.Query, warn: false
  alias Ecommerceshop.Repo

  alias Ecommerceshop.ProdutoModel


  def list_produtos do
    Repo.all(Produto)
  end

  def get_admin do
    query = from ad in "admins",
      where: ad.name == "MarcosAdmin",
      select: ad.id
      Repo.one(query)
  end


  def insert_produto_admin(attrs) do
    #admin = get_admin()
IO.inspect(attrs)

    #  admin = get_admin()
    #  insert_produtos = %{"admin_id" => admin.id, "name" => attrs["name"], "valor" => attrs["valor"]}
    %ProdutoModel{}
    |> ProdutoModel.changeset(attrs)
    |> Repo.insert()
   end


  def get_produto!(id), do: Repo.get!(Produto, id)


  def create_produto(attrs \\ %{}) do
    %ProdutoModel{}
    |> ProdutoModel.changeset(attrs)
    |> Repo.insert()
  end


  def update_produto(%ProdutoModel{} = produto, attrs) do
    produto
    |> ProdutoModel.changeset(attrs)
    |> Repo.update()
  end

  def delete_produto(%ProdutoModel{} = produto) do
    Repo.delete(produto)
  end

    def change_produto(%ProdutoModel{} = produto) do
      ProdutoModel.changeset(produto, %{})
  end
end
