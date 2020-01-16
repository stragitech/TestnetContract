pragma solidity ^0.5.0;

contract AssociateProfitSplitter {
    address payable employeeOne;
    address payable employeeTwo;
    address payable employeeThree;
    
    constructor (address payable _one, address payable _two, address payable _three) public {
        employeeOne = _one;
        employeeTwo = _two;
        employeeThree = _three;
    }
    
    function balance() public view returns(uint) {
        return address(this).balance;
    }
    
    //address payable OWNER = msg.sender;
    
    function deposit() public payable {
        //require (msg.sender == OWNER, "You don't have access to this conrtract");
        uint amount = msg.value / 3;
        
        employeeOne.transfer(amount);
        employeeTwo.transfer(amount);
        employeeThree.transfer(amount);
        
        msg.sender.transfer(msg.value - amount * 3);
    }
    
    function() external payable {
        deposit();
    }
}