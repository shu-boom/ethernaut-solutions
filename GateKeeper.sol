// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface GatekeeperOne {
    function enter(bytes8 _key) external returns (bool);
}

contract PrivacyExecute {
    GatekeeperOne gatekeeperOne;
    constructor(address _gatekeeperOne){
        gatekeeperOne = GatekeeperOne(_gatekeeperOne);
    }
    
    function invokeEnter(bytes8 _key) external{   
        gatekeeperOne.enter{gas: 803144}(_key);
    }


}
