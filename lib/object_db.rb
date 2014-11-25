class ObjectDb
  #require 'json'
  #require_relative './jsonable'
    
  def initialize(filename)
    # Stores one hash per class. Key is class, hash is collection of instances.
    # The collection of instances is also hashed.
    @data = {}
    @filename = filename
  end
  
  def save(object)
    cls = object.class
    ensure_collection(cls)
    
    if object.respond_to?(:id) && !object.id.nil?
      id = object.id
    else
      id = @data[cls].count + 1
      # dynamically add the id field to this instance
      object.class.module_eval { attr_accessor :id}
      object.id = id
    end
    
    @data[cls][id] = object
  end
  
  def get(clazz, id)
    raise "No objects of type #{clazz} stored yet" if @data[clazz].nil?
    return @data[clazz][id]
  end
  
  # TODO: this is just for testing
  def dump_it
    raise @data.to_json
  end
  
  private
  
  def ensure_collection(clazz)
    @data[clazz] = {} if @data[clazz].nil?
  end  
end
