class InexpensiveThingsService
  def self.call(task_id)
    SideEffectCausingExpensiveTask.find(task_id).do_something_inexpensive
  end
end