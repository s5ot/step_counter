require 'sinatra'
require 'dm-core'
require 'dm-validations'
require 'step_record'

DataMapper.setup(:default, "appengine://auto")

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

get '/' do
  @records = StepRecord.all(:order => [:date.desc])
  @step_record = StepRecord.new
  @step_record = StepRecord.new
  erb :index
end

get '/step_record/:id' do
  @step_record = StepRecord.get params[:id]
  erb :step_record
end

post '/step_record' do
  @step_record = StepRecord.new(:date => params[:date], :steps => params[:steps])
  if @step_record.save
    redirect '/'
  else
    erb :index
  end
end

put '/step_record/:id' do
  @step_record = StepRecord.get params[:id]
  @step_record.steps = params[:steps]
  if @step_record.save
    redirect '/'
  else
    erb :step_record
  end
end

delete '/step_record/:id' do
  step_record = StepRecord.get params[:id]
  step_record.destroy!
  redirect '/'
end
