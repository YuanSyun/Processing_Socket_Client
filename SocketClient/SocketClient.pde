/*
    Name: SocketClinet
    Coder: YuanSyun
    Date: 2017//11/21
    Purpose: Test processing Client api.
*/

import processing.net.*;
import java.net.*;

//------------------------------------------------------------
Client myClient; 
int dataIn; 
String inputMsg = "";
int Interval = 5000;
 
//------------------------------------------------------------
void setup() { 
    
  size(200, 200); 

} 

//------------------------------------------------------------
void draw() { 

    SendData(ReadFile("data/octree1x1_fix_blob.tif"));
    delay(Interval);
}

//------------------------------------------------------------
void SendData(String _msg){
    myClient = new Client(this, "127.0.0.1", 5204);
    
    if(myClient.active()){
        myClient.write(_msg);
        print("Send data (length = "+str(_msg.length())+").\n");
    }
    
    myClient.stop();
}

//------------------------------------------------------------
void keyPressed(){
    
    if(key==ENTER){
        print("\n");
        SendData( inputMsg );
        inputMsg = "";
    }else{
       inputMsg += key;
        print(key); 
    }
}

//------------------------------------------------------------
String ReadFile(String _fileName){
    String result = "";
    
    String[] ls = loadStrings(_fileName); 
    for(int i=0;i<ls.length;i++){
        result += ls[i];
    }
    
    return result;
}