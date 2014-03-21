require File.expand_path("#{File.dirname(__FILE__)}/test_helper")

class TestSpaces < MiniTest::Unit::TestCase

  def test_get_spaces
    #response = megams.get_spaces("2176139b9d881aff4c6d451136886913")
    response = Megam::Space.list("87ad7110a5de06838b7ebfc334659f68")
    assert_equal(200, response.status)
  end
end
