# truthy

Truthy patches all objects in crystal with a `to_b` (to boolean) method that will intelligently return
a boolean based on the value of the object. This will differ from `!!(expr)` in a number of cases
including the handling of `""` and `'\0'` as `false`, and proper handling of class instances and arrays (an empty array => false, an array with elements => true).

`expr.to_b` will always return `true` or `false` no matter what you pass to it. `!!(expr)` is used
as a fallback for any language features that are not explictly covered.

An alias is provided so that you can also use `*.truthy?` if you think this makes more sense than
`to_b` without the question mark. Both methods function in exactly the same way and are interchangable.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  truthy:
    github: sam0x17/truthy
```

## Usage

```crystal
require "truthy"

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
"0" # => false
"1" # => true
"200" # => true
"1.0" # => true
"-1.0" # => false
"true" # => true
"false" # => false
"yes" # => true
"no" # => false
"nil" # => false
"none" # => false
"True" # => true
"[]" # => false
"{}" # => false

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

# Arrays
[1, 2, 3].to_b # => true
([] of Int32).to_b # => false

# truthy? alias
true.truthy? # => true
false.truthy? # => false
0.truthy? # => false
1.truthy? # => true
```
