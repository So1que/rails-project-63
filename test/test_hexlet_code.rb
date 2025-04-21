# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  def setup
    @user = Struct.new(:name, :job, keyword_init: true).new(name: "rob")
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form_generation_with_empty_block
    expected = "<form action='#' method='post'></form>"
    actual = HexletCode.form_for @user do |f|
    end
    assert_equal expected, actual
  end

  def test_form_generation_with_attributes
    expected = "<form action='#' method='post' class='hexlet-form'></form>"
    actual = HexletCode.form_for @user, class: "hexlet-form" do |f|
    end
    assert_equal expected, actual
  end

  def test_form_generation_with_url
    expected = "<form action='/profile' method='post' class='hexlet-form'></form>"
    actual = HexletCode.form_for @user, url: "/profile", class: "hexlet-form" do |f|
    end
    assert_equal expected, actual
  end
end
