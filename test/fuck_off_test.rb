# frozen_string_literal: true

require "test_helper"

class FuckingExample
  include FuckOff

  fucking_private def foo
    "Foo"
  end

  fucking_final def bar
    "Bar"
  end
end

class FuckOffTest < Minitest::Test
  def test_that_it_has_a_fucking_version_number
    refute_nil ::FuckOff::VERSION
  end

  def test_it_protects_your_private_fucking_methods
    assert_raises(NoMethodError) do
      FuckingExample.new.foo
    end

    assert_raises(FuckOff::NoMethodError) do
      FuckingExample.new.send(:foo)
    end
  end

  def test_it_protects_your_final_fucking_methods
    assert_raises(FuckOff::NameError) do
      FuckingExample.define_method(:bar) {}
    end
  end
end
