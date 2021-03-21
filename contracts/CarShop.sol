pragma solidity ^0.7.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract CarShop is ERC721 {

    using Counters for Counters.Counter;
    Counters.Counter private carIds;

    struct Car {
        uint price;
        address owner;
    }
    
    mapping(uint256 => Car) public carInventory;
    mapping(uint256 => address) public carToOwnerMapping;
    uint256[] public allCarIds;
    address private companyOfficalEthAddress;

    constructor() public ERC721("Mahindra & Mahindra Limited", "M&M") {
        companyOfficalEthAddress = msg.sender;
    }


    function addCarToInventory(uint256 _price) public returns (uint256) {
        require(_price > 0, 'car price is required.');

        require(msg.sender == companyOfficalEthAddress, 'you do not have permission to perform this action.');

        carIds.increment();
        uint256 _carId = carIds.current();
        _safeMint(companyOfficalEthAddress, _carId);

        Car memory car = carInventory[_carId];
        car.owner = companyOfficalEthAddress;
        car.price = _price;

        carToOwnerMapping[_carId] = companyOfficalEthAddress;
        allCarIds.push(_carId);
        return _carId;
    }

    function sellCar(uint256 _carId, uint256 _price, address _owner) public returns (string memory) {
        require(_carId > 0, 'car id is required.');
        require(_price > 0, 'car price is required.');
        require(_owner != address(0), 'owner address is required.');

        Car memory car = carInventory[_carId];

        require(car.owner != address(0), 'no car found.');
        require(car.owner == companyOfficalEthAddress, 'this car is already sold out.');
        require(car.price <= _price, 'price need to be higher for this car.');

        car.owner = _owner;
        carToOwnerMapping[_carId] = _owner;

        return 'car has been sold out successfully.';
    }
}