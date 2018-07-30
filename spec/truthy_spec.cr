require "./spec_helper"

class DummyClass
  property id : Int32 = 0
end

describe "#to_be" do
  it "works on booleans" do
    true.to_b.should eq true
    false.to_b.should eq false
  end

  it "works on nils and objects" do
    nil.to_b.should eq false
    DummyClass.new.to_b.should eq true
  end

  it "works on 32-bit ints" do
    0.to_b.should eq false
    -1.to_b.should eq false
    1.to_b.should eq true
    2.to_b.should eq true
  end

  it "works on unsigned 32-bit ints" do
    0_u32.to_b.should eq false
    1_u32.to_b.should eq true
    2_u32.to_b.should eq true
  end

  it "works on 64-bit ints" do
    0_i64.to_b.should eq false
    -1_i64.to_b.should eq false
    1_i64.to_b.should eq true
    2_i64.to_b.should eq true
  end

  it "works on unsigned 64-bit ints" do
    0_u64.to_b.should eq false
    1_u64.to_b.should eq true
    2_u64.to_b.should eq true
  end

  it "works on 16-bit ints" do
    0_i16.to_b.should eq false
    -1_i16.to_b.should eq false
    1_i16.to_b.should eq true
    2_i16.to_b.should eq true
  end

  it "works on unsigned 16-bit ints" do
    0_u16.to_b.should eq false
    1_u16.to_b.should eq true
    2_u16.to_b.should eq true
  end

  it "works on 8-bit ints" do
    0_i8.to_b.should eq false
    -1_i8.to_b.should eq false
    1_i8.to_b.should eq true
    2_i8.to_b.should eq true
  end

  it "works on unsigned 8-bit ints" do
    0_u8.to_b.should eq false
    1_u8.to_b.should eq true
    2_u8.to_b.should eq true
  end

  it "works on floats" do
    0.0.to_b.should eq false
    0.01.to_b.should eq true
    -0.1.to_b.should eq false
    10.0.to_b.should eq true
  end

  it "works on chars" do
    '\0'.to_b.should eq false
    'a'.to_b.should eq true
  end

  it "works on strings" do
    "".to_b.should eq false
    "h".to_b.should eq true
    "hey".to_b.should eq true
    "false".to_b.should eq false
    "true".to_b.should eq true
    "No".to_b.should eq false
    "yes".to_b.should eq true
    "nIl".to_b.should eq false
    "-1.0".to_b.should eq false
    "0.0".to_b.should eq false
    "0.1".to_b.should eq true
    "1".to_b.should eq true
    "-1".to_b.should eq false
    "0".to_b.should eq false
    "[]".to_b.should eq false
    "{}".to_b.should eq false
  end

  it "works with truthy? alias" do
    true.truthy?.should eq true.to_b
    false.truthy?.should eq false.to_b
  end

  it "works on arrays" do
    arr = [] of Int32
    arr.to_b.should eq false
    arr << 1
    arr.to_b.should eq true
    arr.clear
    arr.to_b.should eq false
  end
end
