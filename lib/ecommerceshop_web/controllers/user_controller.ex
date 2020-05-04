defmodule EcommerceshopWeb.UserController do
  use EcommerceshopWeb, :controller

  alias EcommerceshopWeb.Helps
  @salt "+Btud6OY3a5viN6RbDXBljp5DnP0py5piXRfaxsePiL6Bxj+JWEVORBd2bmRdOWv"

  def index(conn, _params) do
    users = Helps.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, user} <- Helps.create(user_params) do
    conn
    |> put_status(:created)
    |> put_resp_content_type("application/json")
    |> render("show.json", user: user)
    end
  end

  def listar_produtos(conn, _params) do
    produtos = Helps.list_produtos()
    render(conn, "index.json", produtos: produtos)
  end

  def login(conn, %{"email" => email, "password" => password}) do
    with {:ok, user} <- Helps.get_by_email(email),
      true <- user.password == password do
        token = Phoenix.Token.sign(EcommerceshopWeb.Endpoint, @salt, user.id)
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(%{success: true, token: token}))

      else
        _ ->
          halt(conn)
          |> put_resp_content_type("application/json")
          |> send_resp(401, Jason.encode!(%{"error" => "Erro no login user"}))
    end
  end


end
