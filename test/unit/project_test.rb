require File.dirname(__FILE__) + '/../test_helper'

require 'project_resource'

class ProjectTest < ActiveSupport::TestCase

  # see if we can retrieve a Project by URL
  test "retrieve the thomas_watson project by name" do
    res = ProjectResource.find('thomas-watson',
                               :params => {
                                 :key => $CodeKey,
                                 :format => 'json'
                               })
    assert_not_nil res
  end

  test "retrieve the thomas_watson project by id" do
    res = ProjectResource.find(16,
                               :params => {
                                 :key => $CodeKey,
                                 :format => 'json'
                               })
    assert_not_nil res
  end
end
