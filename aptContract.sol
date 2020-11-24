
pragma solidity >=0.4.22 < 0.7.0;

contract aptContract {
Struct Tenant {
       string name;
       Address ether_wallet;
       unint lease_length; //in months 
 }
address owner; 
Tenants[] tenant;  //list of tenants to auto charge rent amount
uint tenantCount;
uint sDepositFee;
unint rent_cost; //per month

//EVENTS
event rentPayment(address indexed _from, bytes32 indexed _id, uint _value);

event securityDeposit(address indexed _from, bytes32 indexed _id, uint _value);

event depositRefund(address indexed _from, bytes32 indexed _id, uint _value);

//owner validation so only owner can set/change tenants list
modifier onlyOwner(){
require(msg.sender == owner, “Only owner can call this”);
_;
 }

//owner validation so only owner can set/change tenants list
modifier onlyOwner() {
}

//charge all tenants rent amount  
function chargeRent() {
}

//charge security deposit and add new tenant to tenant list
function newTenant() onlyOwner {
}

//return sDepositFee and remove tenant from list
function removeTenant() onlyOwner {
}
}
