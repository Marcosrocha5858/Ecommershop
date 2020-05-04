defmodule EcommerceshopWeb.AdminController do
  use EcommerceshopWeb, :controller

  alias EcommerceshopWeb.Helps
  @salt "AZFAztgkLa/mEsD/FHt0web48iXXAmudjET01EnzIgfTovon0CkwswxVUJeghPwB"

  def index(conn, _params) do
    admins = Helps.list_admins()
    render(conn, "index.json", admins: admins)
  end

  def create(conn, %{"admin" => admin_params}) do
    with {:ok, admin} <- Helps.create_admin(admin_params) do
    conn
    |> put_status(:created)
    |> put_resp_content_type("application/json")
    |> render("show.json", admin: admin)
    end
  end



  def login(conn, %{"email" => email, "password" => password}) do
    with {:ok, admin} <- Helps.get_by_email_admin(email),
      true <- admin.password == password do
        token = Phoenix.Token.sign(EcommerceshopWeb.Endpoint, @salt, admin.id)
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(%{success: true, token: token}))

      else
        _ ->
          halt(conn)
          |> put_resp_content_type("application/json")
          |> send_resp(401, Jason.encode!(%{"error" => "Erro no login Admin"}))
    end
  end

end
