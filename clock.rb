require 'stalker'
handler { |job| Stalker.enqueue(job) }

every 3.minutes, 'marketpoint.fetch'
