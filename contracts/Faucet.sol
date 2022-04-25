pragma solidity 0.6.4;

// Our first contract is a faucet!
contract Faucet {
    // Accept any incoming amount
    receive() external payable {}

    // Give out ether to anyone who asks
    function withdraw(uint withdraw_amount) public {
        // Limit withdrawal amount
        // They are the same 
        // require(withdraw_amount <= 100000000000000000);
        require(withdraw_amount <= 0.1 ether);

        //console.log("Can I outout something here?");

        // Send the amount to the address that requested it
        msg.sender.transfer(withdraw_amount);
    }
}