pragma solidity ^0.4.0;
contract Mount_Talent {

    struct User {
        string name;
        string college; 
        uint uid;// aadhar
        Timeline [] timeline;
        
    }
   
   struct Timeline{
       uint year;
       bytes32 last_company;
       uint last_salary;
   }
   
   address manager;
   User[] public user;
   mapping(uint=>User) public member;
   
   //assing manager
   constructor() public {
       manager=msg.sender;
   }
     /* name,college,uid,year,last_company,last_salary */
    //add new User   
   function add_user(string name,string college,uint uid,uint year, bytes32 last_company,uint last_salary) public{
       require(manager==msg.sender);
       
       uint upid = user.length++;
       
     /*  Timeline({year:year,last_company:last_company,last_salary:last_salary});
       User memory newUser= User(name,college,uid,timeline.push());
        */
       user[upid].name=name;
       user[upid].college=college;
       user[upid].uid=uid;
       user[upid].timeline.push(Timeline(year,last_company,last_salary));
       member[uid]=user[upid];
      
   }
   
   //update old User
   function update_timeline(uint uid,uint year, bytes32 last_company,uint last_salary) public returns(bool result){
       member[uid].timeline.push(Timeline(year,last_company,last_salary));
       result=true;
   }
 
    function getmemb(uint uid) public view returns(uint[] year, bytes32[] cname, uint[] salary){
        User memory u = member[uid];
        year = new uint[](u.timeline.length);
        cname = new bytes32[](u.timeline.length);
        salary = new uint[](u.timeline.length);
        
        for(uint i=0;i<u.timeline.length;i++){
            
        year[i] = u.timeline[i].year;
        cname[i] = u.timeline[i].last_company;
        salary[i] = u.timeline[i].last_salary;
        }
        
        return(year,cname,salary);
    }
   
}


/* address

0x9ab5194ec34cfabe03f0daea8b2aa4d67184b766 */

