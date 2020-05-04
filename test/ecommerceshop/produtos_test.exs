defmodule Ecommerceshop.ProdutosTest do
  use Ecommerceshop.DataCase

  alias Ecommerceshop.Produtos

  describe "produtos" do
    alias Ecommerceshop.Produtos.Produto

    @valid_attrs %{admin_id: 42, name: "some name", valor: 42}
    @update_attrs %{admin_id: 43, name: "some updated name", valor: 43}
    @invalid_attrs %{admin_id: nil, name: nil, valor: nil}

    def produto_fixture(attrs \\ %{}) do
      {:ok, produto} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Produtos.create_produto()

      produto
    end

    test "list_produtos/0 returns all produtos" do
      produto = produto_fixture()
      assert Produtos.list_produtos() == [produto]
    end

    test "get_produto!/1 returns the produto with given id" do
      produto = produto_fixture()
      assert Produtos.get_produto!(produto.id) == produto
    end

    test "create_produto/1 with valid data creates a produto" do
      assert {:ok, %Produto{} = produto} = Produtos.create_produto(@valid_attrs)
      assert produto.admin_id == 42
      assert produto.name == "some name"
      assert produto.valor == 42
    end

    test "create_produto/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Produtos.create_produto(@invalid_attrs)
    end

    test "update_produto/2 with valid data updates the produto" do
      produto = produto_fixture()
      assert {:ok, %Produto{} = produto} = Produtos.update_produto(produto, @update_attrs)
      assert produto.admin_id == 43
      assert produto.name == "some updated name"
      assert produto.valor == 43
    end

    test "update_produto/2 with invalid data returns error changeset" do
      produto = produto_fixture()
      assert {:error, %Ecto.Changeset{}} = Produtos.update_produto(produto, @invalid_attrs)
      assert produto == Produtos.get_produto!(produto.id)
    end

    test "delete_produto/1 deletes the produto" do
      produto = produto_fixture()
      assert {:ok, %Produto{}} = Produtos.delete_produto(produto)
      assert_raise Ecto.NoResultsError, fn -> Produtos.get_produto!(produto.id) end
    end

    test "change_produto/1 returns a produto changeset" do
      produto = produto_fixture()
      assert %Ecto.Changeset{} = Produtos.change_produto(produto)
    end
  end
end
