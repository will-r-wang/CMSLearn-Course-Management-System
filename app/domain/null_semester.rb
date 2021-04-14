class NullSemester
  def id
    raise "You are calling id on a semester that does not exist. Make sure the course you're working with has a"\
      "semester first before calling it."
  end

  def name
    "NullWinter 9000"
  end

  def start_date
    Date.new(0, 1, 1)
  end

  def end_date
    Date.new(9000, 1, 1)
  end
end
