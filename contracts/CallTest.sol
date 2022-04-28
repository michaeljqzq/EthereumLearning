// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

// https://rinkeby.etherscan.io/address/0x0a5b8b76afb0f1f89af5827c73644ba601198e03#events
contract Calc {
    event LogAddr(address, uint, uint256);

    function add(uint a, uint b) public returns(uint) {
        emit LogAddr(msg.sender, a, b);

        return a+b;
    }
}

// 0x2152593807fC8C4eaF670C7aA705Eea87aDd880e
contract CalcCaller {
    event logResult(string);
    // msg.sender is 0x2152593807fC8C4eaF670C7aA705Eea87aDd880e
    function directCall(address calcAddr) public {
        Calc calc = Calc(calcAddr);
        calc.add(1,2);
    }

    // msg.sender is 0x2152593807fC8C4eaF670C7aA705Eea87aDd880e
    function lowLevelCallAbi(address calcAddr) public {
        // notice that param type in function sig has to be "uint256", "uint" will cause call revert
        (bool success, bytes memory result) = calcAddr.call(abi.encodeWithSignature("add(uint256,uint256)", 3, 4));
        if(!success) {
            emit logResult(_getRevertMsg(result));
        }
    }

    // msg.sender is origin EOA called CalcCaller
    // and the log will not in the Calc contract, but in the original tx detail
    function lowLevelDelegateCallAbi(address calcAddr) public {
        (bool success, bytes memory result) = calcAddr.delegatecall(abi.encodeWithSignature("add(uint256,uint256)", 5, 6));
        if(!success) {
            emit logResult(_getRevertMsg(result));
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

    // function lowLevelCall(address calcAddr) public {
    //     calcAddr.call(bytes4(keccak256("add(uint,uint)")), 5, 6);
    // }

    // function lowLevelDelegateCall(address calcAddr) public {
    //     calcAddr.call(bytes4(keccak256("add(uint,uint)")), 7, 8);
    // }
}