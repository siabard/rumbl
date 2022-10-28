defmodule Rumbl.Accounts do
  @moduledoc """
  The Accounts context.
  """

  alias Rumbl.Accounts.User

  def list_users do
    [
      %User{id: "1", name: "Ian", username: "ianwenry"},
      %User{id: "2", name: "Bruce", username: "redpids"},
      %User{id: "3", name: "chri", username: "chrismovid"}
    ]
  end

  def get_user(id) do
    Enum.find(list_users(), fn map -> map.id == id end)
  end
end
