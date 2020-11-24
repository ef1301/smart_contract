// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.8.0;

contract aptContract {
    struct Tenant {
        string name;
        address payable tenant;
        uint256 lease_length; //in months
    }

    address payable public owner;

    Tenant[] tenants; //list of tenants to auto charge rent amount
    uint256 tenantCount;
    uint256 sDepositFee;
    uint256 rent_cost; //per month

    constructor(
        uint256 _tenantCount,
        uint256 _sDepositFee,
        uint256 _rent_cost
    ) public {
        tenantCount = _tenantCount;
        sDepositFee = _sDepositFee;
        rent_cost = _rent_cost;
    }

    //EVENTS
    event rentPayment(
        address indexed _from,
        bytes32 indexed _id,
        uint256 _value
    );

    event securityDeposit(
        address indexed _from,
        bytes32 indexed _id,
        uint256 _value
    );

    event depositRefund(
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
    function changeRent(uint256 new_rent_cost) public onlyOwner {
        rent_cost = new_rent_cost;
    }

    //charge all tenants rent amount
    function payRent() public onlyOwner {}

    //charge security deposit and add new tenant to tenant list
    function newTenant() public onlyOwner {}

    //return sDepositFee and remove tenant from list
    function removeTenant() public onlyOwner {}
}
