begin
    1/0
rescue ZeroDivisionError => e
    puts "Exception Class: #{e.class.name}"
    puts "Exception Message: #{e.message }"
    puts "Exception Backtrace: #{ e.backtrace }"
end

begin
    #1/0
    raise ArgumentError.new("You messed up!")
rescue ArgumentError => e
    puts e.message
end

class PermissionDeniedError < StandardError

    attr_reader :action

    def initialize(message, action)
        super(message)

        @action = action
    end
end

raise PermissionDeniedError.new("Permission Denied", :delete)