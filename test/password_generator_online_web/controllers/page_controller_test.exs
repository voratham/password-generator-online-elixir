defmodule PasswordGeneratorOnlineWeb.PageControllerTest do
  use PasswordGeneratorOnlineWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Password Generator Online"
  end
end
