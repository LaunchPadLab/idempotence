class NoLockNeededService

  # NoLockNeededService.call(1)
  def self.call(task_id)
    ReportGeneratorTask.find(task_id).do_something_inexpensive
  end
  
end