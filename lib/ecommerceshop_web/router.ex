defmodule EcommerceshopWeb.Router do
  use EcommerceshopWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # scope "/", EcommerceshopWeb do
  #   pipe_through :browser

  #   get "/", PageController, :index
  # end

  # pipeline :user do
  #   plug :authentication
  # end


  scope "/api", EcommerceshopWeb do

    #_________Usuario___________________
    post "/user", UserController, :create
    post "/user/login", UserController, :login
    get "/user/produto/listar", ProdutoController, :listar_produtos

    #___________Admin__________________
    post "/admin", AdminController, :create
    post "/admin/login", AdminController, :login

    #___________Produto_________________
    post "/admin/produto", ProdutoController, :create_produto
    get "/admin/produto/listar", ProdutoController, :listar_produtos
    put "/admin/produto/:id", ProdutoController, :update_produto

  end

  # Other scopes may use custom stacks.
  # scope "/api", EcommerceshopWeb do
  #   pipe_through :api
  # end
end
