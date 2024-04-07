defmodule Forum.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias Forum.Accounts.User

  schema "posts" do
    field :title, :string
    field :body, :string
    belongs_to :user, User
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:body, :title,:user_id])
    |> validate_required([:body, :title,:user_id])
  end
end
