
pragma solidity >=0.4.22 < 0.7.0;

contract aptContract{
  address owner; 
  Tenants[] tenant;  //list of tenants to auto charge rent amount
  int tenantCount;
  int sDepositFee;

//owner validation so only owner can set/change tenants list
modifier onlyOwner(){
 }

//charge all tenants rent amount  
function chargeRent(){
}

//charge security deposit and add new tenant to tenant list
function newTenant() onlyOwner{
}

//return sDepositFee and remove tenant from list
function removeTenant() onlyOwner{
}
