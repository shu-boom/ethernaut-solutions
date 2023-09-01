// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SourceContract {
    address payable public destinationContract;

    constructor(address payable _destinationContract) payable {
        destinationContract = _destinationContract;
    }

    function selfDestructAndTransfer() public {
        selfdestruct(destinationContract);
    }
}