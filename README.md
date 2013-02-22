Ps2Census
=========
A ruby wrapper for the Planetside 2 Census API. Does not yet support Service ID's.

IN DEVELOPMENT
==============
I'm hacking on this RIGHT NOW, in the master branch, so if you use this beware
that stuff will break. Frequently.

Also, don't expect it to work as a gem yet.

SUPPORTED OBJECTS
=================
* Character
 * simple fields: name, faction, rank, score, creation_date, active_class
 * complex fields: times, certs
* Outfit
 * simple fields: alias, name, time_created, leader_character_id 
 * methods: leader (returns Ps2Census::Character)

USAGE
=====

Configuration
-------------
NB: At the moment this uses the non-service-ID'ed API, so if you actually use it for any deployed app it's bad, mmkay.
No problem for your own scripts yet, though.

```ruby
Ps2Census.configure do |config|
  config.game = 'ps2-beta'
end
```

Usage
-----
To obtain a character object:
```ruby
Ps2Census::Character.by_id('5428010618015189713')
# => #<Ps2Census::Character:0x2ce7dc0 @name="JesterB", @faction="nc", @rank="3", @score="3639", @creation_date="1360256569", @active_class="Engineer">
```

To access its properties:
```ruby
irb> c.certs
=> #<Ps2Census::CharacterList::Certs:0x2948fa0 @percentagetonext="4", @currentpoints="2213">
irb> c.times
=> #<Ps2Census::CharacterList::Times:0x2948dd8 @last_save="1361556824", @last_login="1361555480", @minutes_played="2957">
```
