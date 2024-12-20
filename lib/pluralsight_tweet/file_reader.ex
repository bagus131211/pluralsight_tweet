defmodule PluralsightTweet.FileReader do
  @doc """
  This function will take a path to a file and find a string that can be tweeted out.

  It will trim all strings and eliminate any strings that are larger than 140 chars.

    ## Example:

      iex> PluralsightTweet.FileReader.get_strings_to_tweet("priv/too_long.txt")
      "short string"

      iex(2)> PluralsightTweet.FileReader.get_strings_to_tweet("priv/k.txt")
      ** (File.Error) could not read file "priv/k.txt": no such file or directory
  """
  def get_strings_to_tweet(path),
    do:
      File.read!(path)
      |> pick_string()

  def pick_string(str),
    do:
      str
      |> String.split("\n")
      |> Stream.map(&String.trim/1)
      |> Stream.filter(&(String.length(&1) <= 140))
      |> Enum.random()
end
