//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {
    address public owner;
    string[] public tokens = ["BTC", "ETH"];
    address[] public players;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "ONLY_OWNER");
        _;
    }

    function changeTokens() public payable {
        string[] storage t = tokens;
        t[0] = "VET";
    }

    function getBalance() public view returns(uint balance) {
        return address(this).balance;
    }

    function transferAll(address payable _caller) external onlyOwner {
        uint256 contractBalance = address(this).balance;
        require(contractBalance > 0, "Contract has no funds to transfer");

        _caller.transfer(contractBalance);
    }

    function start () external {
        address[] storage p = players;
        p.push(msg.sender);
    }

    function concatenate(string memory a, string memory b) public pure returns (string memory) {
        bytes memory bytesA = bytes(a);
        bytes memory bytesB = bytes(b);

        bytes memory concatenated = abi.encodePacked(bytesA, bytesB);

        return string(concatenated);
    }

    receive() external payable { }
}
