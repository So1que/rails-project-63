# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  def setup
    @user = Struct.new(:name, :job, :gender, keyword_init: true).new(name: "rob", job: "hexlet", gender: "m")
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

  def test_form_with_input_fields
    expected = "<form action='#' method='post'><label for='name'>Name</label><input name='name' type='text' value='rob'><label for='job'>Job</label><input name='job' type='text' value='hexlet'></form>"
    actual = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job
    end
    assert_equal expected, actual
  end

  def test_form_with_textarea
    expected = "<form action='#' method='post'><label for='job'>Job</label><textarea name='job' cols='20' rows='40'>hexlet</textarea></form>"
    actual = HexletCode.form_for @user do |f|
      f.input :job, as: :text
    end
    assert_equal expected, actual
  end

  def test_form_with_custom_attributes
    expected = "<form action='#' method='post'><label for='name'>Name</label><input name='name' type='text' value='rob' class='user-input'></form>"
    actual = HexletCode.form_for @user do |f|
      f.input :name, class: "user-input"
    end
    assert_equal expected, actual
  end

  def test_form_with_textarea_custom_attrs
    expected = "<form action='#' method='post'><label for='job'>Job</label><textarea name='job' cols='50' rows='50'>hexlet</textarea></form>"
    actual = HexletCode.form_for @user do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end
    assert_equal expected, actual
  end

  def test_nonexistent_field
    assert_raises(NoMethodError) do
      HexletCode.form_for @user do |f|
        f.input :age
      end
    end
  end

  def test_form_with_labels
    expected = "<form action='#' method='post'><label for='name'>Name</label><input name='name' type='text' value='rob'></form>"
    actual = HexletCode.form_for @user do |f|
      f.input :name
    end
    assert_equal expected, actual
  end

  def test_form_with_submit_button
    expected = "<form action='#' method='post'><input type='submit' value='Save'></form>"
    actual = HexletCode.form_for @user, &:submit
    assert_equal expected, actual
  end

  def test_form_with_custom_submit_text
    expected = "<form action='#' method='post'><input type='submit' value='Wow'></form>"
    actual = HexletCode.form_for @user do |f|
      f.submit "Wow"
    end
    assert_equal expected, actual
  end

  def test_complete_form
    expected = "<form action='#' method='post'><label for='name'>Name</label><input name='name' type='text' value='rob'><label for='job'>Job</label><input name='job' type='text' value='hexlet'><input type='submit' value='Save'></form>"
    actual = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job
      f.submit
    end
    assert_equal expected, actual
  end
end
