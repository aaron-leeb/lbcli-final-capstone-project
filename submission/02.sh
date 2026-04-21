# How many new outputs were created by block 243,825?


hash=$(bitcoin-cli -signet getblockhash 243825)

block=$(bitcoin-cli -signet getblock $hash 2 | jq '[.tx[].vout | length] | add')


