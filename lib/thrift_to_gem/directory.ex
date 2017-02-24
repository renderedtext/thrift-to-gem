defmodule Thrift.To.Gem.Directory do

  def ls_r(path) do
    cond do
      File.dir?(path) ->
        ls(path) |> Enum.map(&ls_r/1) |> Enum.concat
      File.regular?(path) ->
        [path]
      true ->
        raise "Path does not exists"
    end
  end

  def ls(path) do
    File.ls!(path) |> Enum.map(&Path.join(path, &1))
  end

end
