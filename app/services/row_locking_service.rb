class RowLockingService

  # RowLockingService.call(1)
  def self.call(task_id)
    begin
      ActiveRecord::Base.transaction do
        task = ReportGeneratorTask.lock("FOR UPDATE NOWAIT").find(task_id)

        # return task if task.started_at

        task.do_something_expensive
      end
    rescue ActiveRecord::LockWaitTimeout
      "unable to obtain a row lock"
    end
  end

end