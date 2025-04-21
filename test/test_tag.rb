# frozen_string_literal: true

require_relative 'test_helper'

class TagTest < Minitest::Test
  def test_build_single_tag
    assert_equal '<br>', HexletCode::Tag.build('br')
    assert_equal '<img>', HexletCode::Tag.build('img')
    assert_equal '<input>', HexletCode::Tag.build('input')
  end

  def test_build_paired_tag
    assert_equal '<div></div>', HexletCode::Tag.build('div')
    assert_equal '<p></p>', HexletCode::Tag.build('p')
  end

  def test_build_with_attributes
    assert_equal "<input type='text'>", HexletCode::Tag.build('input', type: 'text')
    assert_equal "<img src='path/to/image.jpg' alt='Image'>",
                 HexletCode::Tag.build('img', src: 'path/to/image.jpg', alt: 'Image')
  end

  def test_build_paired_tag_with_attributes
    assert_equal "<div class='container'></div>",
                 HexletCode::Tag.build('div', class: 'container')
  end

  def test_build_paired_tag_with_content
    assert_equal '<div>Hello, World!</div>',
                 HexletCode::Tag.build('div') { 'Hello, World!' }
  end

  def test_build_paired_tag_with_attributes_and_content
    assert_equal "<div class='container'>Hello, World!</div>",
                 HexletCode::Tag.build('div', class: 'container') { 'Hello, World!' }
  end

  def test_build_attributes_string
    assert_equal '', HexletCode::Tag.build_attributes_string({})
    assert_equal " id='container'",
                 HexletCode::Tag.build_attributes_string(id: 'container')
    assert_equal " class='btn' type='submit'",
                 HexletCode::Tag.build_attributes_string(class: 'btn', type: 'submit')
  end
end
