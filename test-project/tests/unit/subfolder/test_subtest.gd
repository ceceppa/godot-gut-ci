extends "res://addons/gut/test.gd"

func test_assert_eq_number_not_equal():
	assert_ne(1, 2, "Should pass  1 != 2")

func test_assert_equal():
	assert_eq('asdf', 'asdf', "Should pass")
