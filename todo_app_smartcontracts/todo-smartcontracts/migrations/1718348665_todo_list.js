var TodoList = artifacts.require('TodoList')
module.exports = function(_deployer) {
  _deployer.deploy(TodoList)
};
