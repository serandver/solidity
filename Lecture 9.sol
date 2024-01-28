 SPDX-License-Identifier GPL-3.0
pragma solidity 0.8.17;

library StringComparer {
  function compare(string memory str1, string memory str2) public pure returns (bool) {
    return keccak256(abi.encodePacked(str1)) == keccak256(abi.encodePacked(str2));
  }
}

interface Living {
  function eat(string memory food) external returns (string memory);
}

contract HasName {
  string internal _name;

  constructor(string memory name) {
    _name = name;
  }
}

abstract contract Animal is Living {
  function eat(string memory food) pure virtual public returns (string memory) {
    return string.concat(
      Animal eats , food
    );
  }

  function sleep() pure virtual public returns (string memory) {
    return Z-z-z-z-z....;
  }

  function speak() pure virtual public returns (string memory) {
    return ...;
  }
}

abstract contract Herbivore is Animal, HasName {

  string constant PLANT = plant;

  modifier eatOnlyPlant(string memory food) {
    require(StringComparer.compare(food, PLANT), Can only eat plant food);
    _;
  }

  function eat(string memory food) pure virtual override public eatOnlyPlant(food) returns (string memory) {
    return super.eat(food);
  }
}

abstract contract Predator is Animal, HasName {

  string constant MEAT = meat;

  modifier eatOnlyMeat(string memory food) {
    require(StringComparer.compare(food, MEAT), Can only eat meat food);
    _;
  }

  function eat(string memory food) pure virtual override public eatOnlyMeat(food) returns (string memory) {
    return super.eat(food);
  }
}

abstract contract Omnivorous is Animal, HasName {

    string constant PLANT = plant;
    string constant MEAT = meat;

    modifier eatOnlyMeatAndPlant(string memory food) {
         require(StringComparer.compare(food, MEAT)  StringComparer.compare(food, PLANT), Can only eat meat or plant food);
        _;
    }

    function eat(string memory food) pure virtual override public eatOnlyMeatAndPlant(food) returns (string memory) {
        return super.eat(food);
    }
}

contract Farmer {
  function feed(address animal, string memory food) pure public returns (string memory) {
    return Animal(animal).eat(food);
  }

  function call(address animal) pure public returns (string memory){
    return Animal(animal).speak();
  }
}

contract Cow is Herbivore {
  constructor(string memory name) HasName(name) {
  }

  function speak() pure override public returns (string memory) {
    return Mooo;
  }
}

contract Horse is Herbivore {
  constructor(string memory name) HasName(name) {
  }

  function speak() pure override public returns (string memory) {
    return Igogo;
  }
}

contract Wolf is Predator {
    constructor(string memory name) HasName(name) {
    }
  
    function speak() pure override public returns (string memory) {
        return Awoo;
    }
}

contract Dog is Omnivorous {
    constructor(string memory name) HasName(name) {
    }

    function speak() pure override public returns (string memory) {
        return Woof;
    }
}