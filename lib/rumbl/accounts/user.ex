defmodule Rumbl.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :username, :string

    timestamps()
  end

  # changeset : 타입, 값, 필드 필터
  # 해당 타입에 맞게 값을 대응시킨다.
  # cast(%User{}, %{username: "yanwenry", email: "siabard@gmail.com"}, [:name, :username])
  # -> User 타입에 맞는 값만이 추출되며, 필터에 의해서 changes 가 걸러진다.
  # -> changes :  %{username: "yanwenry"}
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username])
    |> validate_required([:name, :username])
    |> validate_length(:username, min: 1, max: 20)
  end
end
