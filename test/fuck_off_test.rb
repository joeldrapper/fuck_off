# frozen_string_literal: true

require "test_helper"

class FuckingExample
  include FuckOff

  def public_foo
    foo
  end

  fucking_private def foo
    "Foo"
  end

  fucking_final def bar
    "Bar"
  end

  fucking_final def example_final
    "You can't override this."
  end
end

class ExampleSub < FuckingExample
end

class FuckOffTest < Minitest::Test
  def setup
    @example = FuckingExample.new
  end

  def test_that_it_has_a_fucking_version_number
    refute_nil ::FuckOff::VERSION
  end

  def test_it_protects_your_private_fucking_methods
    assert_raises(NoMethodError) do
      @example.foo
    end

    assert_raises(FuckOff::NoMethodError) do
      @example.send(:foo)
    end
  end

  def test_private_methods_work_internally
    assert_equal "Foo", @example.public_foo
  end

  def test_it_protects_your_final_fucking_methods
    assert_raises(FuckOff::NameError) do
      FuckingExample.define_method(:example_final) {}
    end
  end

  def test_fucking_final_methods_still_work_normally
    assert_equal "Bar", @example.bar
  end

  def test_fucking_inheritance
    assert_raises(FuckOff::NoMethodError) do
      ExampleSub.new.send(:foo)
    end

    assert_raises(FuckOff::NameError) do
      ExampleSub.define_method(:example_final) {}
    end
  end
end
