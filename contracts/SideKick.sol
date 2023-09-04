// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface IHero {
    function alert() external;
}

contract Sidekick {
    function sendAlert(address hero) external {
        // TODO: alert the hero using the IHero interface
        IHero(hero).alert();
        bytes4 signature = bytes4(keccak256("alert()"));
        (bool success, ) = hero.call(abi.encodePacked(signature));
        require(success);
    }

    function relay(address hero, bytes memory data) external {
        (bool success, ) = hero.call(data);

        require(success);
    }
}
