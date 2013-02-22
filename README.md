Ps2Census
=========
A ruby wrapper for the Planetside 2 Census API

IN DEVELOPMENT
==============
I'm hacking on this RIGHT NOW, in the master branch, so if you use this beware
that stuff will break. Frequently.

Also, don't expect it to work as a gem yet.

SUPPORTED OBJECTS
=================
* Character
 * simple fields: name, faction, rank, score, creation_date, active_class
 * complex fields: none yet

USAGE
=====
```ruby
Ps2Census.configure do |config|
  config.endpoint = 'ps2-beta'  # switch to 'ps2' to use the development
                                # API. MAY NOT WORK AS EXPECTED.
end

Ps2Census::Character.by_id('5428010618015189713')
# => #<Ps2Census::Character:0x2ce7dc0 @name="JesterB", @faction="nc", @rank="3", @score="3639", @creation_date="1360256569", @active_class="Engineer">
```
