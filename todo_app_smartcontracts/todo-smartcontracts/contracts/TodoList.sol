// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;

contract TodoList {
    struct Task {
        uint id;
        string content;
        bool completed;
    }

    mapping(uint => Task) public tasks;
    uint public taskCount;

    event TaskCreated(uint id, string content, bool completed);
    event TaskUpdated(uint id, string content, bool completed);
    event TaskDeleted(uint id);
    event TaskCompleted(uint id, bool completed);

    // constructor() {
    //     createTask("Default Task");
    // }
     constructor() {
        
     }

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }

    function completeTask(uint _id) public {
        require(_id > 0 && _id <= taskCount, "Task ID is out of range");
        Task storage _task = tasks[_id];
        _task.completed = true;
        emit TaskCompleted(_id, true);
    }

    function updateTask(uint _id, string memory _content) public {
        require(_id > 0 && _id <= taskCount, "Task ID is out of range");
        Task storage _task = tasks[_id];
        _task.content = _content;
        emit TaskUpdated(_id, _content, _task.completed);
    }

    function deleteTask(uint _id) public {
        require(_id > 0 && _id <= taskCount, "Task ID is out of range");
        delete tasks[_id];
        emit TaskDeleted(_id);
    }

    function getTask(uint _id) public view returns (string memory content, bool completed) {
        Task memory _task = tasks[_id];
        return (_task.content, _task.completed);
    }
}
