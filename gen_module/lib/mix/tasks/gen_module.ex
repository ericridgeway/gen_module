defmodule Mix.Tasks.GenModule do
  use Mix.Task

  @shortdoc "Generate new module and test file"
  def run(params) do
    # TODO require exactly 1 params
    # TODO make into a William-style github includeable

    app_name_snake = Atom.to_string(Mix.Project.config()[:app])
    app_name_camel = Macro.camelize(app_name_snake)

    new_module_snake = Macro.underscore(List.first(params))
    new_module_camel = Macro.camelize(List.first(params))

    proj_path = "lib/#{app_name_snake}"
    test_path = "test"

    full_proj_file_path = "#{proj_path}/#{new_module_snake}.ex"
    full_test_file_path = "#{test_path}/#{new_module_snake}_test.exs"

    proj_content = """
    defmodule #{app_name_camel}.#{new_module_camel} do

    end
    """

    test_content = """
    defmodule #{app_name_camel}Test.#{new_module_camel} do
      use ExUnit.Case

      alias #{app_name_camel}.#{new_module_camel}
    end
    """

    if not(File.dir?(proj_path)) do
      :ok = File.mkdir(proj_path)

      IO.puts("Dir created:")
      IO.puts("  " <> proj_path)
    end

    :ok = File.write(full_proj_file_path, proj_content)
    :ok = File.write(full_test_file_path, test_content)

    IO.puts("Files created:")
    IO.puts("  " <> full_proj_file_path)
    IO.puts("  " <> full_test_file_path)

    # TODO note, there was something about Phoenix may not see the new files. If
    # that happens, use File.touch each of them, I think that fixes
  end
end
