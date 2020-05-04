defmodule EcommerceshopWeb.Authent do
use EcommerceshopWeb, :controller

@salt "AZFAztgkLa/mEsD/FHt0web48iXXAmudjET01EnzIgfTovon0CkwswxVUJeghPwB"

def token_get(conn) do
  case get_req_header(conn, "authorization") do
    ["Bearer" <> token] -> {:ok, token}
    _ -> :error
  end
end

def authentication(conn, _) do
  with {:ok, token} <- token_get(conn),
       {:ok, data} <- Phoenix.Token.verify(EcommerceshopWeb.Endpoint, @salt, token, max_age: 3_900) do
    put_private(conn, :authentication, data)

else
  _ ->
    halt(conn)
    |> put_resp_content_type("application/json")
    |> send_resp(401, Jason.encode!(%{"error" => "Error ao Logar"}))
end
end

end
