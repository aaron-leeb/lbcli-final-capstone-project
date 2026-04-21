# what block height was this tx mined ?
# 49990a9c8e60c8cba979ece134124695ffb270a98ba39c9824e42c4dc227c7eb

txid="49990a9c8e60c8cba979ece134124695ffb270a98ba39c9824e42c4dc227c7eb"

block_hash=$(bitcoin-cli -signet getrawtransaction $txid 1 | jq -r '.blockhash')

block_height=$(bitcoin-cli -signet getblockheader $block_hash | jq -r '.height')

echo $block_height