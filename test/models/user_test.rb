require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "a user should enter a first name" do
		user = User.new
		assert !user.save	#indica que el usuario no debe ser guardado en la BD
		#comprueba si el nombre esta vacio
		assert !user.errors[:first_name].empty?
	end

	test "a user should enter a last name" do
		user = User.new
		assert !user.save	#indica que el usuario no debe ser guardado en la BD
		#comprueba si el nombre esta vacio
		assert !user.errors[:last_name].empty?
	end

	test "a user should enter a profile name" do
		user = User.new
		assert !user.save	#indica que el usuario no debe ser guardado en la BD
		#comprueba si el nombre esta vacio
		assert !user.errors[:profile_name].empty?
	end

	test "a user should have a unique profile names" do
		user = User.new
		user.profile_name = users(:jason).profile_name
		
		users(:jason)

		assert !user.save	#indica que el usuario no debe ser guardado en la BD
		puts user.errors.inspect
		#comprueba si el nombre esta vacio
		assert !user.errors[:profile_name].empty?
	end

	test "a user should have a profile name without spaces" do
		user = User.new
		user.profile_name = "My profile with spaces"

		assert !user.save
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?("Must be formatted correctly.")
	end

	test "a user can have a formatted profile name" do
		
	end
end
