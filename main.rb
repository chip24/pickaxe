require_relative "sub"
require_relative "stack_dumper"

def main_method(arg1, arg2)
  dump_call_stack
end

sub_method(123, "cat")

code = RubyVM::InstructionSequence.compile('a = 1; puts 1 + a')
puts code.disassemble

