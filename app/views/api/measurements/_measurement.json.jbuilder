json.(measurement, :id, :name, :unit, :user_id, :created_at, :updated_at)

json.set! :created_at, measurement.created_at.strftime("%b. %d %Y")


logs ||= nil
unless logs.nil?
  json.logs(logs) do |log|
    json.(log, :id, :amount, :measurement_id, :updated_at)
		json.set! :created_at, log.created_at.strftime("%d %b. %Y")
  end

end





