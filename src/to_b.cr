class Object
  def to_b
    if self.is_a? Bool
      return self
    elsif self.nil?
      return false
    elsif self.is_a? Int
      return self > 0
    elsif self.is_a? Float
      return self > 0.0
    elsif self.is_a? String
      return false if ["", "false", "no", "none", "nil", "[]", "{}"].includes? self.downcase
      begin
        return self.to_i.to_b if self.to_i.to_s == self
      rescue
      end
      begin
        return self.to_f.to_b if self.to_f.to_s == self
      rescue
      end
      return true
    elsif self.is_a? Char
      return self != '\0'
    elsif self.responds_to?(:empty?)
      return !self.empty?.to_b
    elsif self.is_a? Object
      return true
    end
    !!self
  end

  def to_b?
    to_b
  end
end
