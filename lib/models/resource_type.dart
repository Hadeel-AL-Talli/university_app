class ResourceType{
   late int id ;
  late String name ;
  
 

 ResourceType.fromJson(Map<String , dynamic> json){
    id = json['id'];
    name = json['name'];
   
   
    
   
}
}