json.extract! transaction, :id, :tgl, :uraian, :harga, :id_user, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
