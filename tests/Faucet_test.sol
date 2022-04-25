// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.6.4;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "hardhat/console.sol";
import "../contracts/Faucet.sol";

contract FaucetTest {
   
    bytes32[] proposalNames;
   
    Faucet faucetToTest;
    function beforeAll () public {
        //proposalNames.push(bytes32("candidate1"));
        faucetToTest = new Faucet();
    }
    
    function checkWinningProposal () public {
        console.log("Running checkWinningProposal");
        faucetToTest.
        // ballotToTest.vote(0);
        // Assert.equal(ballotToTest.winningProposal(), uint(0), "proposal at index 0 should be the winning proposal");
        // Assert.equal(ballotToTest.winnerName(), bytes32("candidate1"), "candidate1 should be the winner name");
    }
    
    function checkWinninProposalWithReturnValue () public view returns (bool) {
        return ballotToTest.winningProposal() == 0;
    }
}
