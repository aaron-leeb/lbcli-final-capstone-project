# what is the coinbase tx in this block 243,834

# Get the block hash of block 243,834
hash=$(bitcoin-cli -signet getblockhash 243834)

# Get the coinbase transaction id from block 243,834
coinbase_txid=$(bitcoin-cli -signet getblock $hash 2 | jq -r '.tx[0] | .txid')

echo $coinbase_txid