defmodule Otp25SslBugTest do
  use ExUnit.Case
  doctest Otp25SslBug

  @urls [
    "https://google.com",
    "https://reddit.com",
    "https://news.ycombinator.com",
    "https://github.com",
    "https://apple.com",
    "https://firezone.dev",
    "https://microsoft.com",
    "https://login.microsoft.com",
    "https://login.microsoftonline.com"
  ]

  defp finch_get(url) do
    Finch.build(:get, url) |> Finch.request(:finch_app)
  end

  for url <- @urls do
    @tag url: url
    test "successfully connects to #{url}", %{url: url} do
      assert %HTTPoison.Response{} = HTTPoison.get!(url)
      assert {:ok, %Finch.Response{}} = finch_get(url)
    end
  end
end
