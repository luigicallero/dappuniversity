pragma solidity ^0.6.0;

contract MyContract {
    // State Variables
    string public myString = "Hello World!!";
    bytes32 public myBytes32 = "Hello Man!!";
    int public myInt = 1;
    uint public myUint = 1;
    uint256 public myUint256 = 1;
    uint8 public myUint8 = 1;
    
    // Local Variables
    function getValue() public pure returns(uint) {
        uint value = 1;
        return value;
    }
    
}