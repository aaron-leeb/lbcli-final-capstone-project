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
# Use listtransactions to find the txid and blockhash of the receive transaction
# bitcoin-cli -signet -rpcwallet=aaron-leeb listtransactions

# Use getblock to find the coinbase transaction in the block
# bitcoin-cli -signet getblock 00000005d768933ec4ef250a768be84e596eebbfe0b9358eab4da3f6a7cea35d 2 | jq -r '.tx[0] | .txid'

#4)
# Create raw transaction
# Get the input information from UTXO (txid and vout)
# bitcoin-cli -signet -rpcwallet=aaron-leeb listunspent)

# Create a change address
# change_address=$(bitcoin-cli -signet -rpcwallet=aaron-leeb getrawchangeaddress)
# bitcoin-cli -signet -named -rpcwallet=aaron-leeb createrawtransaction inputs='[{"txid":"28909f7c01eed1d2188dae6a98e4a8b7487bab81eb252c2482fcccdcb07c6a33","vout":1646,"sequence":1}]' outputs='[{"tb1qddpcyus3u603n63lk7m5epjllgexc24vj5ltp7":0.00010000},{"tb1qptc0su508l4tx4k2ugvtyag2zp6mfs4h82dqvv":0.00111264}]'
# tx_hex=0200000001336a7cb0dcccfc82242c25eb81ab7b48b7a8e4986aae8d18d2d1ee017c9f90286e06000000010000000210270000000000001600146b43827211e69f19ea3fb7b74c865ffa326c2aaca0b20100000000001600140af0f8728f3feab356cae218b2750a1075b4c2b700000000

# Sign the transaction
# bitcoin-cli -signet -rpcwallet=aaron-leeb signrawtransactionwithwallet "0200000001336a7cb0dcccfc82242c25eb81ab7b48b7a8e4986aae8d18d2d1ee017c9f90286e06000000010000000210270000000000001600146b43827211e69f19ea3fb7b74c865ffa326c2aaca0b20100000000001600140af0f8728f3feab356cae218b2750a1075b4c2b700000000"

# signed_tx_hex=02000000000101336a7cb0dcccfc82242c25eb81ab7b48b7a8e4986aae8d18d2d1ee017c9f90286e06000000010000000210270000000000001600146b43827211e69f19ea3fb7b74c865ffa326c2aaca0b20100000000001600140af0f8728f3feab356cae218b2750a1075b4c2b70247304402200d59482e79abd54cbe9d7c8449dabdff714ae96bc17abb07abf5884925f30b7302205694143d7f34fe5afc87f1af5ed368e637d5a1c866b6914b28f0234f2ba6e1c7012103043279ddc4a5d16dbf78ee2fa7c2521f6c215dad8dfc2f6a5b48753222ee272900000000

# Broadcast the transaction
# bitcoin-cli -signet sendrawtransaction "02000000000101336a7cb0dcccfc82242c25eb81ab7b48b7a8e4986aae8d18d2d1ee017c9f90286e06000000010000000210270000000000001600146b43827211e69f19ea3fb7b74c865ffa326c2aaca0b20100000000001600140af0f8728f3feab356cae218b2750a1075b4c2b70247304402200d59482e79abd54cbe9d7c8449dabdff714ae96bc17abb07abf5884925f30b7302205694143d7f34fe5afc87f1af5ed368e637d5a1c866b6914b28f0234f2ba6e1c7012103043279ddc4a5d16dbf78ee2fa7c2521f6c215dad8dfc2f6a5b48753222ee272900000000"

# txid=bc774f97a08ffa908cb5148d97341e2f3c19eca733fd03796dced3de1707d30e

# Get the block hash of the transaction
# bitcoin-cli -signet -rpcwallet=aaron-leeb gettransaction "bc774f97a08ffa908cb5148d97341e2f3c19eca733fd03796dced3de1707d30e"

# Use getblock to find the coinbase transaction in the block

# bitcoin-cli -signet getblock 00000012434e1b4f4b9bab06678f27ca02d09110649014e504b174fcfdd998d8 2 | jq -r '.tx[0] | .txid'