// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.8.0;

contract HousingContract {
    struct Tenant {
        string name;
        address payable tenant;
        uint256 leaseLength; //in months
    }

    address payable public owner;

    Tenant[] tenants; //list of tenants to auto charge rent amount
    uint256 tenantCount;
    uint256 securityDepositFee;
    uint256 rentCost; //per month

    constructor(
        uint256 _tenantCount,
        uint256 _securityDepositFee,
        uint256 _rentCost
    ) {
        tenantCount = _tenantCount;
        securityDepositFee = _securityDepositFee;
        rentCost = _rentCost;
    }

    //EVENTS
    event RentPayment(
        address indexed _from,
        bytes32 indexed _id,
        uint256 _value
    );

    event SecurityDepositPayment(
        address indexed _from,
        bytes32 indexed _id,
        uint256 _value
    );

    event SecurityDepositRefund(
        address indexed _to,
        bytes32 indexed _id,
        uint256 _value
    );

    //MODIFIERS
    //owner validation so only owner can set/change tenants list
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    /*modifier onlyTenant(){
        require(
            msg.sender == Tenant.tenant
            ); 
            _;
    }*/

    //change rent_cost
    function changeRent(uint256 newRentCost) public onlyOwner {
        rentCost = newRentCost;
    }

    //charge all tenants rent amount
    function payRent() public onlyOwner {}

    //charge security deposit and add new tenant to tenant list
    function newTenant() public onlyOwner {}

    //return sDepositFee and remove tenant from list
    function removeTenant() public onlyOwner {}
}
