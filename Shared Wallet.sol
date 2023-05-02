//SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

contract SharedWallet
{
    address payable public owner;
    mapping(address => uint) private Allowed_address;
    mapping(address => uint) private Amount_deposit;
    bool private lock = false;


// We assign the owner during the start of the smart contract.
    constructor()
    {
       owner = payable(msg.sender);
    }

//This modifier allows only the owner to access the function.
    modifier OnlyOwner()
    {
        require(msg.sender == owner,"SmartWallet: You are not the owner");
        _;
    }
//This modifier allows only the owner or the allowed addresses if the amount they have is greater than
//that they are trying to send.
    modifier OwnerorAllowed(uint _amount)
    {
        require(msg.sender == owner || Allowed_address[msg.sender] >= _amount,"SmartWallet: You are not allowed to transfer");
        _;
    }

//The receive function will store all the addresses who have send money to the contract and how much money they
//have sent.
    receive() external payable
    {
        (Amount_deposit[msg.sender] += msg.value);
    }

//In this function the owner allows other address permission to withdraw certain maount from the contract.
    function GrantAllowance(address _address, uint _amount) public OnlyOwner()
    {
        Allowed_address[_address] = _amount;
    }

//Using this function the Allowance can checked.
    function CheckAllowance(address _account) public view returns(uint)
    {
        return(Allowed_address[_account]);
    }

// This function is used to check the amount deposited by different owners
    function CheckDepositAmount(address _account) public view returns(uint)
    {
        return(Amount_deposit[_account]);
    }

//This function is used to check the balance of the smart contract.
    function CheckBalance() public view returns(uint)
    {
        return address(this).balance;
    }

//This function is used to reduce the amount alloted allowance to an address by the ownwer
    function ReduceAllowance(address _address, uint _amount) internal 
    {
        Allowed_address[_address] -= _amount;
    }
//This function is used to Transfer amount. But onlt the owner and allowed addresses can use it.
    function TransferMoney(uint _amount, address payable _to) public payable OwnerorAllowed(_amount)
    {
        if(msg.sender != owner)
        {
            require(Allowed_address[msg.sender] >= _amount,"SmartWallet: You are not allowed to send");
            ReduceAllowance(msg.sender,_amount);
        }
        require(lock == false,"Aborting!!! transfer is locked");
        lock = true;
        _to.transfer(_amount);
        lock = false;
    }
}