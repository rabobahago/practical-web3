// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
pragma experimental ABIEncoderV2;

contract VoteStorage {
    Vote public vote;
    enum Choices {
        Yes,
        No
    }
    struct Vote {
        Choices choice;
        address voter;
    }

    function createVote(Choices choices) external view returns (Vote memory) {
        return (Vote(choices, msg.sender));
    }
}
