defmodule EcommerceshopWeb.ProdutoController do
  use EcommerceshopWeb, :controller

  alias EcommerceshopWeb.Helps


  def listar_produtos(conn, _params) do
    produtos = Helps.list_produtos()
    render(conn, "index.json", produtos: produtos)
  end

  def create_produto(conn, %{"produto" => produto_params}) do
    with {:ok, produto} <- Helps.insert_produto_admin(produto_params) do
      conn
      |> put_status(:ok)
      |> put_resp_content_type("application/json")
      |> render("show.json", produto: produto)
    end
  end

  def update_produto(conn, %{"id" => id, "produto" => produto_params}) do
    produto = Helps.get_produto(id)
    with {:ok, produto} <- Helps.update_produto(produto,produto_params)  do
      render(conn, "show.json", produto: produto)
    end
  end

  # def show(conn, %{"id" => id}) do
  #   produto = Produtos.get_produto!(id)
  #   render(conn, "show.json", produto: produto)
  # end
end
