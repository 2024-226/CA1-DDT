// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

contract Voting {
    address public owner;
    uint public pollDuration;
    uint public pollEnd;
    bool public pollActive;
    uint public yesVotes;
    uint public noVotes;
    mapping(address => bool) public hasVoted;


constructor(uint _duration) {
    owner = msg.sender;
    pollDuration = _duration;
    pollEnd = block.timestamp + pollDuration;
    pollActive = true;
}

function vote(bool _vote) public {
    require(pollActive, "Voting period has ended.");

    if(_vote) {
        yesVotes++; //++ increases votes by 1 
    } else {
        noVotes++;
    }

    hasVoted[msg.sender] = true;
}

function endPoll() public {
    require(msg.sender == owner, "Only the contract owner can end the poll.");
    require(pollActive, "Poll is already inactive.");

    pollActive = false;

    }
}