class SideEffectCausingExpensiveTask < ApplicationRecord

  def do_something_expensive
    update(started_at: Time.current)
    sleep 45
    update(finished_at: Time.current)
  end

  def do_something_inexpensive
    update(increasing_integer: increasing_integer + 1)
  end

  def self.do_expensive_things_with_an_advisory_lock(task_id)
  end
end
