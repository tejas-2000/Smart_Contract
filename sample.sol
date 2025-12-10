// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleBankVirtual {

    mapping(address => uint256) private balances;

    // Deposit using input amount — NOT real ETH
    function deposit(uint256 amount) external {
        require(amount > 0, "Amount must be > 0");
        balances[msg.sender] += amount;
    }

    function withdraw(uint256 amount) external {
        require(amount > 0, "Amount must be > 0");
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
    }

    function transfer(address to, uint256 amount) external {
        require(to != address(0), "Invalid address");
        require(amount > 0, "Amount must be > 0");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    function getBalance() external view returns (uint256) {
        return balances[msg.sender];
    }
}
