// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.4;

contract Course {
    string public _courseName;
    address public _teacher;
    address[] public _students;
    mapping(address => uint32) _points;
    
    constructor(string memory courseName, address[] memory students) {
        _teacher = msg.sender;
        _courseName = courseName;
        _students = students;
    }
    
    event PointsAdded(address student, uint32 points, uint timestamp);
    
    modifier onlyTeacher() {
        require(msg.sender == _teacher, "Only teacher can call this function");
        _;
    }
    
    function addPoints(address[] calldata students, uint32[] calldata points) public onlyTeacher {
        require(students.length == points.length, "Invalid arrays");
        for (uint i = 0; i < students.length; ++i) {
            require(studentExists(students[i]), "Student does not exist");
             _points[students[i]] += points[i];
            emit PointsAdded(students[i], points[i], block.timestamp);
        }
       
    }
    
    function studentExists(address student) public view returns (bool) {
        for (uint i = 0; i < _students.length; ++i) {
            if (_students[i] == student) {
                return true;
            }
        }
        return false;
    }
    
    function getMark(address student) public view returns (uint8) {
        uint32 studentPoints = _points[student];
        if (studentPoints < 50) { return 20; }
        if (studentPoints < 60) { return 30; }
        if (studentPoints < 70) { return 35; }
        if (studentPoints < 80) { return 40; }
        if (studentPoints < 90) { return 45; }
        return 50;
    }
}