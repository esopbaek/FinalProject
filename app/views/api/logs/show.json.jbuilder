json.(@log, :id, :amount, :measurement_id)
json.set! :created_at, @log.created_at.strftime("%b. %d %Y")