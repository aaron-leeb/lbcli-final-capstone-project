# 1)
# Create a wallet with descriptor using Github username
# wallet=$(bitcoin-cli -signet -named createwallet wallet_name="aaron-leeb" descriptors=true)

# Export receiving descriptor
bitcoin-cli -signet -rpcwallet=aaron-leeb listdescriptors
