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
# bitcoin-cli -signet getblock 0000000841b67babf10f5eaaae0d6a7ca88cb0226e76eda308c26837be07ae4e 2 | jq -r '.tx[0].txid'

