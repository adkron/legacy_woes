require File.dirname(__FILE__) + '/../test_helper'

class ColumnTest < Test::Unit::TestCase
  def setup
    @comment = Comment.create!
  end
  
  def test_save_should_update_dateSubmitted
    assert !@comment.dateSubmitted.nil?
  end
  
  def test_save_should_update_dateUpdated
    assert !@comment.dateUpdated.nil?
  end
  
  def test_save_should_update_timeSubmitted
    assert !@comment.timeSubmitted.nil?
  end
  
  def test_save_should_update_timeUpdated
    assert !@comment.timeUpdated.nil?
  end
end