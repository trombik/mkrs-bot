# frozen_string_literal: true

# Aliases for debugger.
if defined?(PryByebug) || defined?(PryDebugger)
  Pry.commands.alias_command "c", "continue"
  Pry.commands.alias_command "s", "step"
  Pry.commands.alias_command "n", "next"
  Pry.commands.alias_command "f", "finish"
end
