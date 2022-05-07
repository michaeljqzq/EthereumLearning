// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract Return {
    function _delegate() public returns(uint256) {
        assembly {
            let x := 1
            mstore(0, x)
            return (0,32)
        }
    }
}