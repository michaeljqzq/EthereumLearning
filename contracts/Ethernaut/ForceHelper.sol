// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract ForceHelper {
    receive() external payable {}

    function selfdestroy(address payable receiveBalanceAddr) public {
        selfdestruct(receiveBalanceAddr);
    }
}