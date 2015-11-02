class Hash
  def symbolize! 
    self.keys.each do |key|
      self[key.to_sym] = self.delete(key)
    end
  end
  
  def stringify!
    self.keys.each do |key|
      self[key.to_s] = self.delete(key)
    end
    return ahash
  end
end
