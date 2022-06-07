// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract ToDoList{

    uint public taskCount;

    string title;
    string description;
    address createdBy;
    uint256 timeCreatedAt;
    

    struct ToDo{
        uint id;
        string title;
        string description;
        address createdBy;
        uint256 timeCreatedAt;
        //bool completed;
    }

    struct Writers{
        address createdBy;
    }

    ToDo[] private to_do;
    // Writers[] private writers;

    mapping (uint => ToDo) public tasks;
    

    constructor() public {
        addNote("Hello There", "Start your day with some gratitude! Heartfulness is the way to go sweetie <3", 0xC1363eeF8732f146e7931Eb1232910DE01a5C08E );
    }

    function addNote(string memory _title, string memory _description, address _address) public {
        taskCount ++;
        tasks[taskCount] = ToDo(taskCount, _title, _description, _address, timeCreatedAt);
        timeCreatedAt = block.timestamp;   
    }

    function deleteNote(uint _id) public returns (ToDo[] memory){
        delete tasks[_id];
        taskCount--;
        return to_do;
    }
    
    function editNote(uint _id1, string memory _title1, string memory _description1, address _address1) public{
        deleteNote(_id1);
        taskCount++;
        tasks[_id1] = ToDo(taskCount, _title1, _description1, _address1, timeCreatedAt);
        timeCreatedAt = block.timestamp; 
        
    } 

}