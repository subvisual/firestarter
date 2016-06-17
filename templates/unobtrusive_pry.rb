class Binding
  def pry
    raise "You forgot a binding.pry in your tests" if ENV["CI"]
    require "pry"
    super
  end
end
