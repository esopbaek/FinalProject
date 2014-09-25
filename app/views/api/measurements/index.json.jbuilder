json.array!(@measurements) do |measurement|
	json.partial!("measurement", :measurement => measurement, :logs => measurement.logs)
end

