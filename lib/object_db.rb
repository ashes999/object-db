class ObjectDb
  require 'oj'
  
  def initialize(filename)
    # Stores one hash per class. Key is class, hash is collection of instances.
    # The collection of instances is also hashed.
    @data = {}
    @filename = filename
    
    if File.exist?(@filename)
      json = File.read(@filename)
      @data = Oj.load(json)
    end
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
    persist_to_disk
  end
  
  def get(clazz, id)
    raise "No objects of type #{clazz} stored yet" if @data[clazz].nil?
    return @data[clazz][id]
  end
  
  private
  
  # Make sure the collection we're about to add to, exists.
  def ensure_collection(clazz)
    @data[clazz] = {} if @data[clazz].nil?
  end  
   
  def persist_to_disk
    json = Oj.dump(@data)
    File.write(@filename, json)
  end
  
end
