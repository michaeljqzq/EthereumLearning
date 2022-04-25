pragma solidity ^0.7.0;
// SPDX-License-Identifier: UNLICENSED

contract Owned {
    address payable owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only owner can call this method");
        _;
    }
}

contract Mortal is Owned {
    function destroy() public onlyOwner {
        selfdestruct(owner);
    }
}

contract Faucet is Mortal {
    event Withdrawal(address indexed to, uint amount);
    event Deposit(address indexed from, uint amount);

    // Accept any incoming amount
    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    // Give out ether to anyone who asks
    function withdraw(uint withdraw_amount) public {
        // Limit withdrawal amount
        // They are the same 
        // require(withdraw_amount <= 100000000000000000);
        require(withdraw_amount <= 0.1 ether, "withdraw amount cannot exceed 100000000000000000");

        //console.log("Can I outout something here?");

        // Send the amount to the address that requested it
        msg.sender.transfer(withdraw_amount);
        emit Withdrawal(msg.sender, withdraw_amount);
    }

    function adminWithdraw(uint withdraw_amount) public onlyOwner{
        msg.sender.transfer(withdraw_amount);
        emit Withdrawal(msg.sender, withdraw_amount);
    }

    function testRevert() public {
        revert("Test for revert function");
    }
}