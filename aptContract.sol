/* Assignment04 - Smart Contract
 * 
 * Members:
 * - Emily F: emily.fang11@myhunter.cuny.edu
 * - Kun Y: kun.yu25@myhunter.cuny.edu
 * - Sunjin Y: sunjin.yoon07@myhunter.cuny.edu
 * - Wonseok Y: WonSeok.Yang22@myhunter.cuny.edu
 * - Kevin: kevin.fncw@gmail.com
 * - Jason C: jason.chen53@myhunter.cuny.edu
 * 
 * Repository link:
 * - https://github.com/ef1301/smart_contract 
 */

pragma solidity >=0.4.22 < 0.7.0;

contract aptContract {
    struct Tenant {
        string name;
        address payable tenant;
        uint lease_length; //in months 
    }
    
    address payable public owner;
    
    Tenant[] tenants;  //list of tenants to auto charge rent amount
    uint tenantCount;
    uint sDepositFee;
    uint rent_cost; //per month
    

    constructor(
        uint _tenantCount,
        uint _sDepositFee,
        uint _rent_cost
    ) public {
        tenantCount = _tenantCount;
        sDepositFee = _sDepositFee;
        rent_cost = _rent_cost;
    }

    //EVENTS
    event rentPayment(address indexed _from, bytes32 indexed _id, uint _value);

    event securityDeposit(address indexed _from, bytes32 indexed _id, uint _value);

    event depositRefund(address indexed _to, bytes32 indexed _id, uint _value);

    //MODIFIERS
    //owner validation so only owner can set/change tenants list
    modifier onlyOwner(){
        require(
            msg.sender == owner
        ); 
        _;
    }

    /*modifier onlyTenant(){
        require(
            msg.sender == Tenant.tenant
            ); 
            _;
    }*/
    

    //change rent_cost
    function changeRent(uint new_rent_cost) public onlyOwner {
        rent_cost = new_rent_cost;
    }

    //charge all tenants rent amount  
    function payRent() public onlyOwner {
    }

    //charge security deposit and add new tenant to tenant list
    function newTenant() public onlyOwner {
    }

    //return sDepositFee and remove tenant from list
    function removeTenant() public onlyOwner {
    }
}
