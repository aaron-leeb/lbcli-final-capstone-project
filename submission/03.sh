# Which tx in block 216,351 spends the coinbase output of block 216,128?

# Get the block hash of block 216,128
hash_128=$(bitcoin-cli -signet getblockhash 216128)

# Get the coinbase transaction id from block 216,128
coinbase_txid=$(bitcoin-cli -signet getblock $hash_128 2 | jq -r '.tx[0].txid')

# Get the block hash of block 216,351
hash_351=$(bitcoin-cli -signet getblockhash 216351)

# Find the transaction in block 216,351 that spends the coinbase output of block 216,128
result=$(bitcoin-cli -signet getblock $hash_351 2 | jq -r '.tx[] | select(.vin[].txid == "'"$coinbase_txid"'") | .txid')

echo $result
