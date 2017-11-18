defmodule DictClient do

  def send_command(socket, word) do
    cmd = "DEFINE * " <> to_string(word) <> "\n"
    :ok = :gen_tcp.send(socket, cmd)
    definition = ""
    definition = get_definition(socket, definition)
  end
  
  defp get_definition(socket, definition) do
    case :gen_tcp.recv(socket, 0, 1000) do
      {:ok, data} ->
	# append to definition
	definition = definition <> data
	get_definition(socket, definition)
      {:error, :timeout} ->
	definition
    end
  end

end
