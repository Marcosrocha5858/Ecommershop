defmodule EcommerceshopWeb.AdminControllerTest do
  use EcommerceshopWeb.ConnCase

  setup do
    params = %{"name" => "MarcosAdmin", "email" => "admin@gmail.com", "password" => "122"}

    admin =
      build_conn()
      |> post("/api/admin", %{"admin" => params})
      |> json_response(201)
      |> Map.get("data")

    {:ok, %{admin: admin}}
  end

  test "Test  login Admin", %{admin: admin} do
    # #Login
    login =
      build_conn()
      |> post("/api/admin/login", %{"email" => admin["email"], "password" => admin["password"]})
      |> json_response(200)

    {:ok, %{login: login}}

  end

  test "Criar Produto" do
    #Cadastrar produto
    params_produtos = %{name: "camisa", valor: 2}

    produto =
      build_conn()
      |> post("/api/admin/produto", %{"produto" => params_produtos})
      |> json_response(200)
      |> Map.get("data")

    {:ok, %{produto: produto}}
    # #Update Produto
    build_conn()
    |> put("/api/admin/produto/#{produto["id"]}",%{"produto"=> %{"name" => "tenis"}})
    |> json_response(200)
    |> Map.get("data")

     #Listar Produto
     build_conn()
     |> get("/api/admin/produto/listar")
     |> json_response(200)
     |> Map.get("data")

  end

end
