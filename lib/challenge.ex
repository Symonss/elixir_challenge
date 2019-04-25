defmodule Challenge do
  @moduledoc """
  Documentation for Challenge.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Challenge.hello()
      :world

  """
  def fetch do
    HTTPoison.start
    try do
    result = HTTPoison.get!("htps://jsonplaceholder.typicode.com/todos/1")
    JSON.decode(result.body) |> elem(1)
    rescue
      IO.puts "error"
    e in RuntimeError -> IO.puts("An error occurred: " <> e.message)
    end



  end

  def display do

    result = fetch()
    IO.puts  "title: " <> result["title"]
    IO.puts  ~s( Status:  #{result["completed"]},)

  end
end
