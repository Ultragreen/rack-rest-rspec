require 'pstore'

def memorize(options)
  $store = PStore.new('/tmp/data.pstore')
  $store.transaction do
    options.each do |key, val|
      $store[key] = val
    end
    $store.commit
  end
end

def retrieve(key)
  $store = PStore.new('/tmp/data.pstore')
  $store.transaction { $store[key] }
end
