class RandomCode
  class << self
    def numeric(length)
      raise 'Length should be more then 0' if length <= 0

      rand(10**(length - 1)..10**length).to_s.chars.shuffle.join
    end
  end
end
