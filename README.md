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

Object DB automatically adds the `id` field and increments it appropriately if you try to save objects without an id. You can also explicitly set the ID to any value you want (it doesn't have to be an integer).

