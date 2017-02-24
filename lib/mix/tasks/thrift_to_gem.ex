defmodule Mix.Tasks.Thrift.To.Gem do

  def run(options) do
    {params, _, _} = OptionParser.parse(options)

    thrift_file = params[:source] |> validate_thfit_file
    output_dir  = params[:output] |> validate_output_dir
    gem_name    = params[:name]   |> validate_gem_name

    Thrift.To.Gem.generate(gem_name, thrift_file, output_dir)
  end

  def validate_thfit_file(thrift_file) do
    unless thrift_file do
      IO.puts "You must provide the '--source' parameter that points to a thrift file"
      System.halt(1)
    end

    unless File.exists?(thrift_file) do
      IO.puts "Thrift file does not exits. FAIL."
      System.halt(1)
    end

    thrift_file
  end

  def validate_output_dir(output_dir) do
    unless output_dir do
      IO.puts "You must provide the '--output' parameter that points to the output directory"
      System.halt(1)
    end

    if File.exists?(output_dir) do
      IO.puts "Output directory already exists. FAIL."
      System.halt(1)
    end

    output_dir
  end

  def validate_gem_name(gem_name) do
    unless gem_name do
      IO.puts "You must provide the '--name' parameter that represents the name of the gem"
      System.halt(1)
    end

    unless gem_name =~ ~r/[a-z][a-z0-9_]*/ do
      IO.puts "Gem name can only contain lowercase characters, numbers and underscores"
      System.halt(1)
    end

    gem_name
  end

end
