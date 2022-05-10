// SPDX-License-Identifier: MIT

pragma solidity <0.7.0;

contract MotorBikeHelper {
  function selfDestroy() public {
    selfdestruct(address(0x0));
  }
}