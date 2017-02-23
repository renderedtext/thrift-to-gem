defmodule Mix.Tasks.Thrift.To.Gem do

  def run(options) do
    {params, _, _} = OptionParser.parse(options)

    thrift_file = params[:source]
    output_dir  = params[:output]

    generate(thrift_file, output_dir)
  end

  def generate(nil, _) do
    IO.puts "You must provide the '--source' parameter that points to a thrift file"
  end

  def generate(_, nil) do
    IO.puts "You must provide the '--output' parameter that points to the output directory"
  end

  def generate(thrift_file, output_dir) do
    IO.puts "Generation gem in '#{output_dir}' based on '#{thrift_file}' thrift definition"
  end

end
