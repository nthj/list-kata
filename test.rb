require 'minitest/autorun'
require './list'

describe List do
  before do
    @list = List.new
  end

  describe "for an empty list" do
    it "returns nil for a find call" do
      assert_nil(@list.find("fred"))
    end

    it "adds one item when we call add" do
      @list.add("fred")
      assert_equal("fred", @list.find("fred").value())
    end
  end

  describe "for a list with one item" do
    before do
      @list.add("fred")
    end

    it "does not return the only item when searching for another" do
      assert_nil(@list.find("wilma"))
    end
  end

  describe "for a list with two items" do
    before do
      @list.add("fred")
      @list.add("wilma")
    end

    it "returns the correct first item when searched for" do
      assert_equal("fred", @list.find("fred").value)
    end

    it "returns the correct second item when searched for" do
      assert_equal("wilma", @list.find("wilma").value)
    end

    it "returns all values in an array" do
      assert_equal(["fred", "wilma"], @list.values())
    end

    it "deletes an element by value" do
      @list.delete(@list.find("wilma"))
      assert_equal(["fred"], @list.values())
    end
  end
end

# list = List.new
# assert_nil(list.find("fred"))
# list.add("fred")
# assert_equal("fred", list.find("fred").value())


# assert_nil(list.find("wilma"))

# list.add("wilma")
# assert_equal("fred",  list.find("fred").value())
# assert_equal("wilma", list.find("wilma").value())
# assert_equal(["fred", "wilma"], list.values())

# list = List.new
# list.add("fred")
# list.add("wilma")
# list.add("betty")
# list.add("barney")
# assert_equal(["fred", "wilma", "betty", "barney"], list.values())
# list.delete(list.find("wilma"))
# assert_equal(["fred", "betty", "barney"], list.values())
# list.delete(list.find("barney"))
# assert_equal(["fred", "betty"], list.values())
# list.delete(list.find("fred"))
# assert_equal(["betty"], list.values())
# list.delete(list.find("betty"))
# assert_equal([], list.values())
