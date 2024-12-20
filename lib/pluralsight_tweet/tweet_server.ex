defmodule PluralsightTweet.TweetServer do
  use GenServer

  def start_link(_), do: GenServer.start_link(__MODULE__, :ok, name: :tweet_server)

  def init(:ok), do: {:ok, %{}}

  def handle_cast({:tweet, tweet}, _state) do
    PluralsightTweet.Tweet.send(tweet)
    {:noreply, %{}}
  end

  def tweet(tweet), do: GenServer.cast(:tweet_server, {:tweet, tweet})
end
