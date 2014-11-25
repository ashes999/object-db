# Object DB

Object DB is an embedded, pure ruby object (NoSQL) database.

# Use

```
db = ObjectDb.new('test.objectdb')

class Cat
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

c = Cat.new('mittens')
db.save(c)
puts c.id # automatically added, set to 1

c.get(Cat, 1) # returns mittens
```

## Automatic IDs

Object DB automatically adds the `id` field and increments it appropriately if you try to save objects without an id. You can also explicitly set the ID to any value you want (it doesn't have to be an integer).

## Changing Class Definitions

Object DB persists data as JSON. If you create a class, persist it, and add fields, you will still be able to deserialize that data (albeit that the new fields will be `nil`).

Conversely, if you remove a field from your class and deserialize the old version, it will still have the removed field.
