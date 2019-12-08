# README

This repo documents an incompatibility between https://github.com/rails/spring (a default of a new Rails installation)  and https://github.com/dry-rb/dry-monads.

## Run

`./bin/rails r "BreakHalt.new.call"`

Results in an error like:

.../lib/ruby/gems/2.6.0/gems/spring-2.1.0/lib/spring/application.rb:305:in `reject!': can't modify frozen Array (FrozenError)

This appears to be because Dry::Monads::Do::Halt#backtrace is frozen and
rails/spring calls reject! on it:

https://github.com/dry-rb/dry-monads/blob/11ca509889044ea75eb7d21e2a8f1691295de92e/lib/dry/monads/do.rb#L134
https://github.com/rails/spring/blob/ee687859008e947bc905b95121e306e2948d31c9/lib/spring/application.rb#L305

The following will work without error:

`DISABLE_SPRING=1 ./bin/rails r "BreakHalt.new.call"`
