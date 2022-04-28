// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import {Library} from "../Library.sol";

contract GatekeeperTwoHelper {
  constructor(address gateAddr) public {
    // When the contract is during initialzation, extcodesize is 0
    delegate(gateAddr);
  }
  function delegate(address gateAddr) public {
        bytes8 param = bytes8(~uint64(bytes8(keccak256(abi.encodePacked(address(this))))));
        (bool success, bytes memory retMsg) = gateAddr.call(abi.encodeWithSignature("enter(bytes8)", param));
        if(!success) {
            string memory errMsg = Library._getRevertMsg(retMsg);
            require(success, errMsg);
        }
    }
}