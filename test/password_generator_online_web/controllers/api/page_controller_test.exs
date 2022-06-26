defmodule PasswordGeneratorOnlineWeb.Api.PageControllerTest do
  use PasswordGeneratorOnlineWeb.ConnCase

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "generators a password" do
    test "generates password with only length passed", %{conn: conn} do
      conn = post(conn, Routes.page_path(conn, :api_generate), %{"length" => "5"})

      assert %{"password" => _pass} = json_response(conn, 200)
    end

    test "generates password with one option", %{conn: conn} do
      options = %{"length" => "5", "numbers" => "true"}
      conn = post(conn, Routes.page_path(conn, :api_generate), options)
      assert %{"password" => _pass} = json_response(conn, 200)
    end
  end

  describe "returns errors" do
    test "error when no options", %{conn: conn} do
      conn = post(conn, Routes.page_path(conn, :api_generate), %{})
      assert %{"error" => _error} = json_response(conn, 200)
    end

    test "error when length not integer", %{conn: conn} do
      conn = post(conn, Routes.page_path(conn, :api_generate), %{"length" => "ab"})
      assert %{"error" => _error} = json_response(conn, 200)
    end

    test "error when options not booleans", %{conn: conn} do
      conn =
        post(conn, Routes.page_path(conn, :api_generate), %{
          "length" => "5",
          "invalid" => "invalid"
        })

      assert %{"error" => _error} = json_response(conn, 200)
    end

    test "error when not valid options", %{conn: conn} do
      conn =
        post(conn, Routes.page_path(conn, :api_generate), %{
          "length" => "5",
          "invalid" => "true"
        })

      assert %{"error" => _error} = json_response(conn, 200)
    end
  end
end
