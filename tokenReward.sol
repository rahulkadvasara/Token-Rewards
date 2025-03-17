// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract TokenRewards {
    string public projectTitle = "Token Rewards for Completing Challenges";
    string public projectDescription = "A platform where users earn tokens by completing various tasks or challenges.";
    
    address public owner;
    mapping(address => uint256) public userTokens;
    
    event TokensEarned(address indexed user, uint256 amount);
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }
    
    constructor() {
        owner = msg.sender;
    }
    
    function rewardTokens(address user, uint256 amount) external onlyOwner {
        userTokens[user] += amount;
        emit TokensEarned(user, amount);
    }
    
    function getUserTokens(address user) external view returns (uint256) {
        return userTokens[user];
    }
}
