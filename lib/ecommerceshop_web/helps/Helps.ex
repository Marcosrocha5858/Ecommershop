defmodule EcommerceshopWeb.Helps do
  import Ecto.Query, warn: false
  alias Ecommerceshop.Repo

  # alias Loja.Produtos.Produto
  alias Ecommerceshop.UserModel
  alias Ecommerceshop.AdminModel
  alias Ecommerceshop.ProdutoModel

  def list_admins do
    Repo.all(AdminModel)
  end

  def list_users do
    Repo.all(UserModel)
  end

  def list_produtos do
    # query = from p in "produtos",
    #   where: p.id > 0
    #     Repo.all(query)
    Repo.all(ProdutoModel)
  end


  def get_produto(id), do: Repo.get!(ProdutoModel, id)

  def get_admin do
    query = from ad in "admins",
      where: ad.name == "MarcosAdmin",
      select: ad.id
      Repo.one(query)
  end

  def get_by_email(email) do
    case Repo.get_by(UserModel, email: email) do
      nil ->
        {:error, "Erro no help"}

      user ->
        {:ok, user}
    end
  end
  def get_by_email_admin(email) do
    case Repo.get_by(AdminModel, email: email) do
      nil ->
        {:error, "Erro no help"}

      admin ->
        {:ok, admin}
    end
  end

  # def list_produtos do
  #   Repo.all(UserModel)
  # end

  def update(%UserModel{} = args, attrs) do
    args
    |> UserModel.changeset(attrs)
    |> Repo.update()
  end


  def create(attrs \\ %{}) do
    %UserModel{}
    |> UserModel.changeset(attrs)
    |> Repo.insert()
  end

  def insert_produto_admin(attrs \\ %{}) do
     admin = get_admin()
     insert_produtos = %{"admin_id" => admin, "name" => attrs["name"], "valor" => attrs["valor"]}
    %ProdutoModel{}
    |> ProdutoModel.changeset(insert_produtos)
    |> Repo.insert()
   end

   def update_produto(%ProdutoModel{} = args, attrs) do
    admin = get_admin()
    update_produtos = %{"admin_id" => admin}
    updates_merg = Map.merge(update_produtos, attrs)
    args
    |> ProdutoModel.changeset(updates_merg)
    |> Repo.update()

   end
  def create_admin(attrs \\ %{}) do
    %AdminModel{}
    |> AdminModel.changeset(attrs)
    |> Repo.insert()
  end

  def delete(%UserModel{} = args) do
    Repo.delete(args)
  end


end
