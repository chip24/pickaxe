# Implements a simple accumulator, whose
# value is accessed via the attribute
# _counter_. Calling the method Counter#inc
# increments this value.
# @author Dave Thomas
# @note This is only a minimal example
# @version 1.0

class Counter
    # The current value of the count
    attr_reader :counter
    # create a new counter with the given
    # initial value
    # @param initial_value [Integer] the initial value of the counter
    def initialize(initial_value = 0)
        @counter = initial_value
    end
    # increment the current value of the count
    # @example Increment the counter
    #   Counter.new,increment #=> counter.value == 1
    # @return [Integer] The new value of the counter
    def inc
        @counter += 1
    end
end

