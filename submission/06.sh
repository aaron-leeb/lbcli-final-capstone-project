# Only one tx in block 243,821 signals opt-in RBF. What is its txid?

# Get the block hash of block 243,821
hash=$(bitcoin-cli -signet getblockhash 243821)

# Get the txids of transactions in block 243,821 that signal opt-in RBF by checking if any input has a sequence number less than or equal to 4294967293
txids=$(bitcoin-cli -signet getblock $hash 2 | jq -r '.tx[] | select(.vin[].sequence <= 4294967293) | .txid')

echo $txids