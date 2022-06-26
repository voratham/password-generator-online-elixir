defmodule PasswordGeneratorOnlineWeb.Api.PageController do
  use PasswordGeneratorOnlineWeb, :controller

  def api_generate(conn, params) do
    case PasswordGenerator.generate(params) do
      {:ok, pass} -> json(conn, %{password: pass})
      {:error, error} -> json(conn, %{error: error})
    end
  end
end
