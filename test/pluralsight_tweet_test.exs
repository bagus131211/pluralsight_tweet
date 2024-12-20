defmodule PluralsightTweetTest do
  use ExUnit.Case
  doctest PluralsightTweet

  test "greets the world" do
    assert PluralsightTweet.hello() == :world
  end

  @tag watching: true
  test "untruth test" do
    assert 2 + 2 == 5
  end
end
