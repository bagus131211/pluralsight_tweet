defmodule PluralsightTweet.FileReaderTest do
  import PluralsightTweet.FileReader
  import Mock
  use ExUnit.Case

  doctest PluralsightTweet.FileReader

  test "Passing a file should return a string" do
    str =
      get_strings_to_tweet(Path.join("#{:code.priv_dir(:pluralsight_tweet)}", "sample.txt"))

    assert str != nil
  end

  test "Will not return a string longer than 140 characters" do
    str =
      get_strings_to_tweet(Path.join("#{:code.priv_dir(:pluralsight_tweet)}", "too_long.txt"))

    assert str == "short string"
  end

  test "An empty string should return empty string" do
    with_mock File, read!: fn _ -> "" end do
      assert <<>> == pick_string("")
    end
  end

  test "The string should be trimmed" do
    with_mock File, read!: fn _ -> " ABC   " end do
      assert "ABC" == get_strings_to_tweet("doesn't exist.txt")
    end
  end
end
