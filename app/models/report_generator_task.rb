class ReportGeneratorTask < ApplicationRecord
  def do_something_expensive
    return self if generation_finished_at
    update(generation_started_at: Time.current)
    sleep 15
    update(generation_finished_at: Time.current)
    self.reload
  end

  def do_something_inexpensive
    update(view_count: view_count + 1)
    self
  end

  def reset
    update(generation_started_at: nil, generation_finished_at: nil)
    self
  end
end
