require File.dirname(__FILE__) + '/../test_helper'

class ProjectTest < ActiveSupport::TestCase

  # see if we can retrieve a Project by URL
  test "retrieve the thomas_watson project by name" do
    res = ProjectResource.find('thomas-watson',
                               :params => { :key => 'f85d971013d77265d0c6f4eb1369839117e7f90f'})
    assert_not_nil res
  end

  test "retrieve the thomas_watson project by id" do
    res = ProjectResource.find(16,
                               :params => { :key => 'f85d971013d77265d0c6f4eb1369839117e7f90f'})
    assert_not_nil res
  end
end
