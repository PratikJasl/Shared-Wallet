# Shared-Wallet
Smart Wallet Application to deposit &amp; lend money to allowed participants.

## Description 📌
* This project is called the shared wallet. 
* It has a single owner who is the owner of all the funds in the wallet. 
* Only he can give allowance to other addresses to use a fixed amount of funds from the wallet. 
* Anybody can deposit money into the wallet, but only the owner and people with an allowance can withdraw money from it.

## Algorithm 📌
*	The wallet has a single owner who is the owner of the wallet. 
* The owner can withdraw any amount and give allowance to other addresses to withdraw the amount.
*	Anybody can deposit money into the wallet, but only the owner and allowed addresses can withdraw the money.
*	Owner will specify how much money an allowed address can withdraw.
*	Only the owner can change the allowances.

## Technology Stack📌
* Solidity
* Ganache
* Hardhat
* Ether.js
* Remix IDE

## Instructions & Information📌
1) Open [Remix IDE](https://remix.ethereum.org).
2) Create a new folder.
3) Inside the folder, create a solidity file with extension [.sol].
4) Copy paste code from github to the newly created .sol file.
5) Start Ganache.
6) Select Quickstart Ethereum option.
7) In Remix, select DEPLOY & RUN TRANSACTIONS.
8) In Environment dropdown, select Dev - Ganache Provider.
9) In Ganache JSON-RPC Endpoint, enter ganache rpc server. You will find rpc server details in ganache.
10) Compile & Deploy the code in remix.
