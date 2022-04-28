// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Util {
    function isContract(address _addr) private returns (bool isContract){
        uint32 size;
        assembly {
            size := extcodesize(_addr)
        }
        return (size > 0);
    }
}