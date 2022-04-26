
// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;

    
    event NewWave(address indexed from, uint256 timestamp, string message);

    
    struct Wave {
        address waver; // The address of the user who waved.
        string message; // The message the user sent.
        uint256 timestamp; // The timestamp when the user waved.
    }

    
    Wave[] waves;

    constructor() {
        console.log("I AM SMART CONTRACT. POG.");
    }

    
    function wave(string memory _message) public {
        totalWaves += 1;
        console.log("%s waved w/ message %s", msg.sender, _message);

        waves.push(Wave(msg.sender, _message, block.timestamp));

        emit NewWave(msg.sender, block.timestamp, _message);
    }
    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }


// SPDX-License-Identifier: UNLICENSED

// pragma solidity ^0.8.0;

// import "hardhat/console.sol";

// contract WavePortal {
//     uint256 totalWaves;
//     constructor () {
//         console.log("WavePortal smart contract deployed");
//         console.log("------     -----");
//     }
//     function wave() public {
//       totalWaves += 1;
//       console.log("%s has waved", msg.sender);
//     }
//     function getTotalWaves() public view returns (uint256) {
//       console.log("Total waves recieved: %s", totalWaves);
//       return totalWaves;
//     }
// }
}