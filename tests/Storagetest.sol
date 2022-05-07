pragma solidity >=0.7.0 <0.9.0;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "hardhat/console.sol";
import {Library} from "../contracts/Library.sol";

contract StorageTest {
    bool slot0;
    uint slot1;
    mapping (address => uint) slot2;
    bytes32[] slotx;

    constructor() public {
        slot0 = true;
        slot1 = 123;
        slotx.push("abc");
    }

    function print() public {
        console.log(slot0);
        console.log(slot1);
        console.log(Library.bytes32ToHexString(slotx[0]));
        console.log(Library.bytes32ToHexString(slotx[1]));
        console.log(Library.bytes32ToHexString(slotx[2]));
    }
}