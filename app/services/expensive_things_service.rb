class ExpensiveThingsService
  def self.call(task_id)
    begin
      ActiveRecord::Base.transaction do
        task = SideEffectCausingExpensiveTask.lock("FOR UPDATE NOWAIT").find(task_id)
        task.do_something_expensive
      end
    rescue ActiveRecord::LockWaitTimeout
      "unable to obtain a row lock"
    end
  end
end