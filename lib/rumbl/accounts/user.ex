defmodule Rumbl.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true

    timestamps()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(pass))

      _ ->
        changeset
    end
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

  def registration_changeset(user, params) do
    user
    |> changeset(params)
    |> cast(params, [:password])
    |> validate_required([:password])
    |> validate_length(:password, min: 6, max: 100)
    |> put_pass_hash()
  end
end
