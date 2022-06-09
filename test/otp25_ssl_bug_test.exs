defmodule Otp25SslBugTest do
  use ExUnit.Case
  doctest Otp25SslBug

  @https_url "https://login.microsoftonline.com"
  @http_url "http://neverssl.com"

  defp finch_get(url) do
    Finch.build(:get, url) |> Finch.request(:finch_app)
  end

  test "successfully connects to https urls with HTTPoison" do
    assert %HTTPoison.Response{} = HTTPoison.get!(@https_url)
  end

  test "succesfully connects to http urls with HTTPoison" do
    assert %HTTPoison.Response{} = HTTPoison.get!(@http_url)
  end

  test "succesfully connects to https urls with Finch" do
    assert {:ok, %Finch.Response{}} = finch_get(@https_url)
  end

  test "succesfully connects to http urls with Finch" do
    assert {:ok, %Finch.Response{}} = finch_get(@http_url)
  end
end
