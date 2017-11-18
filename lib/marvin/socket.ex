defmodule Socket do

  def connect_socket do 
    opts = [:binary, packet: 0, active: false]
    {:ok, socket} = :gen_tcp.connect('localhost', 2628, opts)
    {:ok, confirm} = :gen_tcp.recv(socket, 0)
    socket
  end

end
