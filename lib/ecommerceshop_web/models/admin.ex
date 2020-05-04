defmodule Ecommerceshop.AdminModel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "admins" do
    field :email, :string
    field :name, :string
    field :password, :integer

    timestamps()
  end

  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [:name, :password, :email])
    |> validate_required([:name, :password, :email])
  end


end
