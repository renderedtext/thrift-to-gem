defmodule Thrift.To.Gem do

  def generate(gem_name, thrift_file, output_dir) do
    IO.puts "Generation '#{gem_name}' gem in '#{output_dir}' based on '#{thrift_file}' thrift definition"

    gem_module_name = gem_name |> String.split("_") |> Enum.map(&String.capitalize/1) |> Enum.join

    template_files |> Enum.each(fn(path) ->
      output = path |> String.replace("GEM_NAME", gem_name) |> String.replace("template", output_dir)

      Mix.Shell.IO.cmd("mkdir -p #{Path.dirname(output)}")
      Mix.Shell.IO.cmd("cp #{path} #{output}")

      # replace 'GEM_NAME' with the passed gem name
      Mix.Shell.IO.cmd("sed -i 's|GEM_NAME|#{gem_name}|g' #{output}")

      # replace 'GEM_MODULE_NAME' with the passed gem name
      Mix.Shell.IO.cmd("sed -i 's|GEM_MODULE_NAME|#{gem_module_name}|g' #{output}")
    end)
  end

  def template_files do
    "template" |> Thrift.To.Gem.Directory.ls_r
  end

end
