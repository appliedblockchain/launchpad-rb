pragma solidity ^0.5.10;
pragma experimental ABIEncoderV2;


contract HelloWorld {
    string public helloWorldText;

    event HelloWorldUpdated(string value);

    constructor() public {
        helloWorldText = "Hello World";
    }

    function updateHelloWorld(string memory _helloWorldText) public returns (bool) {
        helloWorldText = _helloWorldText;

        emit HelloWorldUpdated(helloWorldText);
        return true;
    }

    function getHelloWorld() public view returns (string memory) {
        return helloWorldText;
    }
}
