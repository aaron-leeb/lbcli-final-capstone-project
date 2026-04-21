# How many new outputs were created by block 243,825?

# Get the block hash of block 243,825
hash=$(bitcoin-cli -signet getblockhash 243825)

# Get the number of new outputs created in block 243,825 by summing the lengths of the vout arrays of all transactions in the block
new_utxo_count=$(bitcoin-cli -signet getblock $hash 2 | jq '[.tx[].vout | length] | add')

echo $new_utxo_count  
