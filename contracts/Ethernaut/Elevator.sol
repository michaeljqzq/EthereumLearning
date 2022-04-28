// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Building {
  function isLastFloor(uint) external returns (bool);
}


contract Elevator {
  event logAddr(address addr);
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    emit logAddr(msg.sender);
    // Building building = Building(msg.sender);

    // if (! building.isLastFloor(_floor)) {
    //   floor = _floor;
    //   top = building.isLastFloor(floor);
    // }
  }
}