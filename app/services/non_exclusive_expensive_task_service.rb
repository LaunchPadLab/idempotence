class NonExclusiveExpensiveTaskService

  # NonExclusiveExpensiveTaskService.call(1)
  # NonExclusiveExpensiveTaskService.call(1, timeout_seconds: 1)
  def self.call(task_id, opts = nil)
    advisory_lock_key = name + task_id.to_s

    SideEffectCausingExpensiveTask.with_advisory_lock(advisory_lock_key, opts) do
      task = SideEffectCausingExpensiveTask.find(task_id)

      # return task if task.finished_at

      task.do_something_expensive
    end
  end
  
end