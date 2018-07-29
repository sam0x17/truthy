# to_b

Monkey-patches all objects in crystal with a `to_b` (to boolean) method that will intelligently return
a boolean based on the value of the object. This will differ from `!!(expr)` in a number of cases
including the handling of `""` and `'\0'` as `false`.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  to_b:
    github: sam0x17/to_b
```

## Usage

```crystal
require "to_b"

# Booleans
true.to_b # => true
false.to_b # => false

# Objects
nil.to_b # => false
SomeClass.new.to_b # => true

# Strings / Characters
"".to_b # => false
"hey".to_b # => true
'\0'.to_b # => false
'c'.to_b # => true

# Integers
0.to_b # => false
-1.to_b # => false
1.to_b # => true
10.to_b # => true
0_i64.to_b # => false
1_i8.to_b # => true
-1_i16.to_b # => false
0_u64.to_b # => false
3_u16.to_b # => true

# Floats
0.0.to_b # => false
1.0.to_b # => true
0.001.to_b # => true
-0.001.to_b # => false
-1.0.to_b # => false
23.342.to_b # => true
```
