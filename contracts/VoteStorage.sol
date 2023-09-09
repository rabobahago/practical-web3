// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
pragma experimental ABIEncoderV2;

contract VoteStorage {
    enum Choices {
        Yes,
        No
    }
    Vote[] public votes;
    struct Vote {
        Choices choice;
        address voter;
    }
    Vote none = Vote(Choices(0), address(0));

    function createVote(Choices choice) external {
        votes.push(Vote(choice, msg.sender));
    }

    function findVote(address _add) internal view returns (Vote memory) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == _add) {
                return votes[i];
            }
        }
        return none;
    }

    function hasVoted(address _address) public view returns (bool) {
        return findVote(_address).voter == _address;
    }

    function findChoice(address _address) external view returns (Choices) {
        return findVote(_address).choice;
    }
}
