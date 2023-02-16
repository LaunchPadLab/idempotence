class NonExclusiveExpensiveThingsService
  ADVISORY_LOCK_KEY = "non_exclusive_expensive_things_service"

  def self.call(task_id, opts = [])
    SideEffectCausingExpensiveTask.with_advisory_lock(ADVISORY_LOCK_KEY + task_id.to_s, opts) do
      task = SideEffectCausingExpensiveTask.find(task_id)
      
      return task if task.finished_at

      task.do_something_expensive
    end
  end
end