// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    constructor () {
        console.log("WavePortal smart contract deployed");
        console.log("------     -----");
    }
    function wave() public {
      totalWaves += 1;
      console.log("%s has waved", msg.sender);
    }
    function getTotalWaves() public view returns (uint256) {
      console.log("Total waves recieved: %s", totalWaves);
      return totalWaves;
    }
}