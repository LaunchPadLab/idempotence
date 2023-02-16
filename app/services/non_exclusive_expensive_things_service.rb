class NonExclusiveExpensiveThingsService
  ADVISORY_LOCK_KEY = "non_exclusive_expensive_things_service"

  def self.call(task_id)
    SideEffectCausingExpensiveTask.with_advisory_lock(ADVISORY_LOCK_KEY) do
      SideEffectCausingExpensiveTask.find(task_id).do_something_expensive
    end
  end
end