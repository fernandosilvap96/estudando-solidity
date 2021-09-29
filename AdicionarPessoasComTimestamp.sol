pragma solidity 0.5.1;

contract MyContract {
    uint256 public peopleCount = 0;
    mapping(uint => Person) public people;

    uint256 startTime;
    
    //Só será possivel adicionar pessoas depois que o timestamp informado chegar
    modifier onlyWhileOpen() {
        require(block.timestamp >= startTime);
        _;
    }

    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }

    constructor() public {
        startTime = 1544668513; // Timestamp definido, precisamos gerar um novo Timestamp pelo site Unix Timestamp Converter
    }

    function addPerson(string memory _firstName, string memory _lastName) public onlyWhileOpen {
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }

    function incrementCount() internal {
        peopleCount += 1;
    }
}
