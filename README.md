# Demo of OTP 25 SSL bug

OTP 25 seems to have issues connecting to certain hosts, e.g. `https://login.microsoftonline.com`, causing timeouts.

To demonstrate the issue, simply clone the repo, run `mix deps.get` and then `mix test` and notice the failures:

```
jamil@Jamils-iMac:~/tmp/otp_25_ssl_bug (main=) % mix test


  1) test successfully connects to https urls with HTTPoison (Otp25SslBugTest)
     test/otp25_ssl_bug_test.exs:12
     ** (HTTPoison.Error) :timeout
     code: assert %HTTPoison.Response{} = HTTPoison.get!(@https_url)
     stacktrace:
       (httpoison 1.8.1) lib/httpoison.ex:156: HTTPoison.request!/5
       test/otp25_ssl_bug_test.exs:13: (test)

..

  2) test succesfully connects to https urls with Finch (Otp25SslBugTest)
     test/otp25_ssl_bug_test.exs:20
     match (=) failed
     code:  assert {:ok, %Finch.Response{}} = finch_get(@https_url)
     left:  {:ok, %Finch.Response{}}
     right: {:error, %Mint.TransportError{__exception__: true, reason: :timeout}}
     stacktrace:
       test/otp25_ssl_bug_test.exs:21: (test)

.

Finished in 13.4 seconds (0.00s async, 13.4s sync)
1 doctest, 4 tests, 2 failures

Randomized with seed 705913
```
