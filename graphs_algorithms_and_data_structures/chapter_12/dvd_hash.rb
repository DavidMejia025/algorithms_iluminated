class DvdHash
  def initialize(key = nil, val = nil)
    @key = key
    @val = val
  end

  def val=(val)
    @val = val
  end

  def val
    @val
  end

  def key=(key)
    @key = key
  end

  def key
    @key
  end
end


# Test:
#
p DvdHash.new()
p hash = DvdHash.new("david", 1325)
