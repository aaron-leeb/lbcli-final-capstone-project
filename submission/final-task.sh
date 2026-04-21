# 1)
# Create a wallet with descriptor using Github username
# wallet=$(bitcoin-cli -signet -named createwallet wallet_name="aaron-leeb" descriptors=true)

# Export receiving descriptor
# bitcoin-cli -signet -rpcwallet=aaron-leeb listdescriptors

# 2)
# Create a native segiwit address using the receiving descriptor
# bitcoin-cli -signet -rpcwallet=aaron-leeb deriveaddresses "wpkh([2e4f3516/84h/1h/0h]tpubDCrXi3T2NLjkwHbtD4tQnRDdppzkAaBieQWALZYwhSUk5BipmbcpEwvZGdA7nZGGTAMV9UicgsiFqWpj2igxx9ejJ6Q79B8zXgB6nbGzpam/0/*)#m0cu4u40" "[0,0]"

# 3)
# Fund the address from the faucet
# Use listtransactions to find the txid and blockhash of the transaction
# bitcoin-cli -signet -rpcwallet=aaron-leeb listtransactions

# Use getblock to find the coinbase transaction in the block
# bitcoin-cli -signet getblock 00000005d768933ec4ef250a768be84e596eebbfe0b9358eab4da3f6a7cea35d 2 | jq -r '.tx[0] | .txid'

