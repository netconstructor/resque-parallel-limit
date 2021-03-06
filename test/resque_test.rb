require File.dirname(__FILE__) + '/test_helper'

# make sure the worlds not fallen from beneith us.
class ResqueTest < Test::Unit::TestCase

  def test_resque_version
    major, minor, patch = Resque::Version.split('.')
    assert_equal 1, major.to_i, 'major version does not match'
    assert_operator minor.to_i, :>=, 8, 'minor version is too low'
  end

  def test_resque_plugin_lint
    assert_nothing_raised do
      Resque::Plugin.lint(Resque::Plugins::ParallelLimit)
    end
  end

end