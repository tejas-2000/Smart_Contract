// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleBank {
    
    mapping(address => uint256) private balances;

    // Deposit ETH into your account
    function deposit() external payable {
        require(msg.value > 0, "Must deposit more than 0");
        balances[msg.sender] += msg.value;
    }

    // Withdraw ETH from your account
    function withdraw(uint256 amount) external {
        require(amount > 0, "Amount must be > 0");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    // Transfer ETH to another user inside the contract
    function transfer(address to, uint256 amount) external {
        require(to != address(0), "Invalid address");
        require(amount > 0, "Amount must be > 0");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    // Check your balance
    function getBalance() external view returns (uint256) {
        return balances[msg.sender];
    }
}
