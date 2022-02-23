pragma solidity ^0.4.25;

contract PunkFactory {

    event NewPunk(uint punkId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Punk {
        string name;
        uint dna;
    }

    Punk[] public punks;

    function _createPunk(string _name, uint _dna) private {
        uint id = punks.push(Punk(_name, _dna)) - 1;
        emit NewPunk(id, _name, _dna);
    }

    function _generateRandomDna(string _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomPunk(string _name) public {
        uint randDna = _generateRandomDna(_name);
        _createPunk(_name, randDna);
    }

}
