defmodule EcommerceshopWeb.UserControllerTest do
  use EcommerceshopWeb.ConnCase

  setup do
    params = %{"name" => "Marcos", "email" => "marcos@gmail.com", "password" => "123"}

    user =
      build_conn()
      |> post("/api/user", %{"user" => params})
      |> json_response(201)
      |> Map.get("data")
      {:ok , %{user: user}}
  end

  test "Insert User", %{user: user} do
        build_conn()
        |> post("/api/user/login", %{"email" => user["email"], "password" => user["password"]})
        |> json_response(200)

        {:ok, %{user: user}}

        #Listar Produto
     build_conn()
     |> get("/api/user/produto/listar")
     |> json_response(200)
     |> Map.get("data")
    end


end
