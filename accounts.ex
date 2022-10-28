defmodule Rumbl.Accounts do
  @moduledoc """

  The Accounts context.

  """

  alias Rumbl.Accounts.User

  def list_users do
    [
      %User{id: "1", name: "Yeonho", username: "ianwenry"},
      %User{id: "2", name: "SiaBard", username: "siabard"},
      %User{id: "3", name: "Yan", username: "yanwenry"}
    ]
  end

  def get_user(id) do
    Enum.find(list_users(), fn map -> map.id == id end)
  end

  def get_user_by(params) do
    Enum.find(list_users(), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end)
  end
