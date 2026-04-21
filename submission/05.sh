# How many satoshis did this transaction pay for fee?: b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb

txid="b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb"

# Calculate the sum of the output values
vout_total=$(bitcoin-cli -signet getrawtransaction $txid 1 | jq '[.vout[].value] | add')

# Get the previous transaction id and vout index from input 0
prev_tx_id=$(bitcoin-cli -signet getrawtransaction $txid 1 | jq -r '.vin[0].txid')
prev_vout=$(bitcoin-cli -signet getrawtransaction $txid 1 | jq -r '.vin[0].vout')

# Get the value of the specific output being spent
vin=$(bitcoin-cli -signet getrawtransaction $prev_tx_id 1 | jq ".vout[$prev_vout].value")

# Calculate the fee in satoshis
fee=$(jq -n "($vin - $vout_total) * 100000000 | round")

echo $fee
