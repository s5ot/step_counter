class StepRecord
  include  DataMapper::Resource
  property :id,  Serial
  property :date, Time, :required => true, :default => lambda{|r,p| Time.now}
  property :steps, Integer, :required => true
end 

