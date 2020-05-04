defmodule EcommerceshopWeb.ProdutoView do
  use EcommerceshopWeb, :view
  alias EcommerceshopWeb.ProdutoView

  def render("index.json", %{produtos: produtos}) do
    %{data: render_many(produtos, ProdutoView, "produto.json")}
  end

  def render("show.json", %{produto: produto}) do
    %{data: render_one(produto, ProdutoView, "produto.json")}
  end

  def render("produto.json", %{produto: produto}) do
    %{id: produto.id,
      name: produto.name,
      valor: produto.valor,
      admin_id: produto.admin_id}
  end
end
