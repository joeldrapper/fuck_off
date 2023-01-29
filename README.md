To prevent use of your private API, this gem allow you to mark methods as being `fucking_private` and/or `fucking_final`.

```ruby
class Example
  include FuckOff

  fucking_private def foo
    "Foo"
  end

  fucking_final def bar
    "Bar"
  end
end
```

If you try to call a `fucking_private` method anyway, it will raise a `NoMethodError`.

```ruby
Example.new.send(:foo) # raises a FuckOff::NoMethodError
```

If you try to redefine a `fucking_final` method, it will raise a `NameError`.

```ruby
Example.define_method(:bar) { "New bar" } # raises a FuckOff::NameError
```

Yes, this is a joke. But it also kind of [works](https://github.com/joeldrapper/fuck_off/blob/main/test/fuck_off_test.rb).

## Prior art

[I told you it was private](https://github.com/fxn/i-told-you-it-was-private)
