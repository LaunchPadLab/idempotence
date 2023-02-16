class ExpensiveThingsService
  def self.call(task_id)
    begin
      ActiveRecord::Base.transaction do
        task = SideEffectCausingExpensiveTask.lock("FOR UPDATE NOWAIT").find(task_id)
        task.do_expensive_things_with_a_row_lock
      end
    rescue ActiveRecord::LockWaitTimeout
      nil
    end
  end
end