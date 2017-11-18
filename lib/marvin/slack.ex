defmodule Marvin.Slack do
  use Slack
  import DoThing
  import Preprocess

  @token Application.get_env(:marvin, __MODULE__)[:token]

  def start_link, do: start_link(@token, [])
  
  def handle_message(message = %{type: "message"}, slack, state) do
    if Regex.run ~r/^<@#{slack.me.id}>:\s/, message.text do
      cmd = preprocess(message, slack, state)
      reply = do_thing(cmd)
      send_message("<@#{message.user}> " <> reply, message.channel, slack)
    end

    {:ok, state}
  end

  # Catch all message handler so we don't crash
  def handle_message(_message, _slack, state) do
    {:ok, state}
  end

end
