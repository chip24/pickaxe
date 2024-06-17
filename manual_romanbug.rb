require_relative "romanbug"
require "minitest/autorun"

r = Roman.new(1)
fail "'i' expected" unless r.to_s == "i"

r = Roman.new(9)
fail "'ix' expected" unless r.to_s == "ix"

class TestRoman < Minitest::Test
    def test_simple
        assert_equal("i", Roman.new(1).to_s)
        assert_equal("ix", Roman.new(9).to_s)
        assert_equal("iii", Roman.new(3).to_s)
        assert_equal("iv", Roman.new(4).to_s)
        assert_equal("ii", Roman.new(2).to_s)
    end
end