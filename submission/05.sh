# How many satoshis did this transaction pay for fee?: b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb

txid="b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb"

# Calculate the sum of the output values
vout_sum=$(bitcoin-cli -signet getrawtransaction $txid 1 | jq '[.vout[].value] | add')

# Get the previous transaction id from the first input
prev_tx_id=$(bitcoin-cli -signet getrawtransaction $txid 1 | jq -r '.vin[0].txid')

# Calculate the sum of the input values
vin_sum=$(bitcoin-cli -signet getrawtransaction $prev_tx_id 1 | jq '[.vout[].value] | add')

# Calculate the fee in satoshis
fee=$(jq -n "($vin_sum - $vout_sum) * 100000000 | round")

echo $fee
