require_relative 'test_config'
require_relative "#{SOURCE_ROOT}/object_db"

class ObjectDbTest < Test::Unit::TestCase

	def test_get_gets_set_value_with_generated_id
	  expected = Cat.new('mittens')
	  db = ObjectDb.new(TEST_DB_NAME)
	  db.save(expected)
	  assert_not_nil(expected.id)
	  
	  actual = db.get(Cat, expected.id)
	  assert_not_nil(actual)
	  assert_not_nil(actual.id)
	  assert_equal(expected.id, actual.id)
	  
	  assert(db.get(Cat, 999).nil?)
	end
	
	def test_get_gets_set_value_with_preset_id
	  expected = Dog.new('fang')
	  expected.id = 'fuzzy' # doesn't have to be an int
	  db = ObjectDb.new(TEST_DB_NAME)
	  db.save(expected)
	  assert_not_nil(expected.id)
	  
	  actual = db.get(Dog, expected.id)
	  assert_not_nil(actual)
	  assert_equal(expected.id, actual.id)
	  
	  assert(db.get(Dog, 1).nil?)
	end

	def test_save_updates_existing_objects
	  expected = Cat.new('kitty')
	  db = ObjectDb.new(TEST_DB_NAME)
	  db.save(expected)
	  assert_not_nil(expected.id)
	  
	  actual = db.get(Cat, expected.id)
	  assert_equal('kitty', actual.name)
	  
	  expected.name = 'hurayrah'
	  db.save(expected)
	  actual = db.get(Cat, expected.id)
	  assert_equal('hurayrah', actual.name)	  
	end	
end

# Dummy classes for testing
class Cat

  attr_accessor :name
  def initialize(name)
    @name = name
  end
  
  def greet
    return "#{@name} meows!"
  end
end

class Dog

  attr_reader :name
  attr_accessor :id
  
  def initialize(name)
    @name = name
  end
  
  def greet
    return "#{@name} barks!"
  end
end
