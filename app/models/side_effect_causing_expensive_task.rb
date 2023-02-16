class SideEffectCausingExpensiveTask < ApplicationRecord
  def do_something_expensive
    update(started_at: Time.current)
    sleep 15
    update(finished_at: Time.current)
    self
  end

  def do_something_inexpensive
    update(increasing_integer: increasing_integer + 1)
    self
  end

  def reset
    update(started_at: nil, finished_at: nil)
  end
end
