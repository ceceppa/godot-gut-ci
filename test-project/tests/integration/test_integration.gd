extends "res://addons/gut/test.gd"

func before_all():
	gut.p("Runs once before all tests")

func before_each():
	gut.p("Runs before each test.")

func after_each():
	gut.p("Runs after each test.")

func after_all():
	gut.p("Runs once after all tests")

func test_assert_eq_number_not_equal():
	assert_ne(1, 2, "Should pass  1 != 2")

func test_assert_equal():
	assert_eq('asdf', 'asdf', "Should pass")
