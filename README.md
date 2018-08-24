Lisa Li 
Ethereum 2018 Developer Program Final Project – Online-Marketplace
What does the project do?
This is an Ethereum Blockchain Dapp for an online marketplace. 
The project is developed on a VirtualBox VM running Ubuntu 16.04.
You may
•	Add/Remove Admins
•	Add/Remove Store Owners
•	Open/Close Stores
•	Get Store/StoreOwners
•	ChangeStoreowners
•	etc.
How to set it up?
To interact with this Dapp, you will need the following tools...
•	npm    Node.js
•	Ganache:  npm install -g ganache-cli
•	Truffle:  npm install -g truffle
•	All npm dependencies for the Dapp
•	Metamask


Smart Contract Migration
truffle migrate --reset
Smart Contract Testing

truffle test 
Running the Dapp

npm install

npm run dev
Interacting with the Dapp
1.	Copy the seed phrase from the ganache-gui
2.	Open Metamask in your browser and make sure the localhost:8545 network is selected
3.	Click the "Restore from seed phrase" link, paste in the seed phrase, enter start123 as the password, and click OK.
4.	You can now either refresh the page manually or click the OK button on the error pop up.
5.	If you are connected you should see "Admin" with an address, balance, and block number in the top right corner.
6.	From here you are an admin. go to the "Add/Remove Store Owners" tab. Copy an account address from the ganache terminal, paste it into the text box, and click "Add". Metamask should prompt you for the transaction, hit "Add".
7.	You should see the UI update with a new Store Owner. Copy the private key for this store owner from the ganache terminal, open Metamask, and import the account using the private key.
8.	You should see the UI change from an Admin view to a Store Owner view. Open 2 or 3 new stores and name them whatever you wish.

Notes: deployed to Rinkeby through MetaMask with Ethereum address: 0x1057600E79D33f7c0ED05842c09e63D8c90b51D5

