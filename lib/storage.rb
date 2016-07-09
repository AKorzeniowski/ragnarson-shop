class Storage 
  def next_id
    @@last_id += 1
  end

  def add(id, qty)
    if product = @content.find { |i| i[:id] == id } 
      product[:qty] += 1
    else
      @content.push({:id => id, :qty => qty})
    end
  end

  def remove(id)
    if product = @content.find { |i| i[:id] == id } 
      product[:qty] -= 1
    else
      raise ProductNotFound
    end  
  end

  def validate(input, type)
    unless input.nil? then
        if input.is_a? type then return input else raise TypeError end
    else
      raise ArgumentError
    end
  end
end