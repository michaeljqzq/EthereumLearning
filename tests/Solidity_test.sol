// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "hardhat/console.sol";

contract SolidityTest {   
    function convertTest() public {
        uint x = 0x1111111111111111111111111111111122222222222222222222222222222222;
        bytes32 b = 0x1111111111111111111111111111111122222222222222222222222222222222;

        Assert.equal(uint128(x), 0x22222222222222222222222222222222, "");
        Assert.equal(bytes16(b) == 0x11111111111111111111111111111111, true, "");
    }

    function temp() public {
        address sender = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
        bytes8 _gateKey = 0x0000000000000000;
        bytes8 ans = bytes8(~uint64(bytes8(keccak256(abi.encodePacked(sender)))));
        //console.log(ans);
    }
}
