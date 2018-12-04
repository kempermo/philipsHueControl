#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){	
    hue.setup("192.168.178.21", "uvzNGjdc6LX9YjZeKEDbcUlS34YOwE2xaJ2odlFz");
    
    //Prepare Interface
    redSlider.setup("Rot", ofVec2f(60,700), ofVec2f(ofGetScreenWidth()-120,15), 100, 0);
    greenSlider.setup("Grün", ofVec2f(60,850), ofVec2f(ofGetScreenWidth()-120,15), 100, 0);
    blueSlider.setup("Blau", ofVec2f(60,1000), ofVec2f(ofGetScreenWidth()-120,15), 100, 0);
    
    colorWheel.load("Gradient.png");
    positionOfWheel.x = ofGetScreenWidth()/2-442/2;
    positionOfWheel.y = 80;
    colorWheelSize = 442;
    centerOfWheel.x = positionOfWheel.x+colorWheelSize/2;
    centerOfWheel.y = positionOfWheel.y+colorWheelSize/2;
    
    color.r = 0;
    color.g = 0;
    color.b = 0;
}

//--------------------------------------------------------------
void ofApp::update(){
}

//--------------------------------------------------------------
void ofApp::draw(){
    ofSetBackgroundColor(0, 0, 0);
    
    colorWheel.draw(positionOfWheel.x,positionOfWheel.y, colorWheelSize, colorWheelSize);
    
    redSlider.draw();
    greenSlider.draw();
    blueSlider.draw();
}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
    redSlider.dragAble(touch);
    greenSlider.dragAble(touch);
    blueSlider.dragAble(touch);
    
    float distance = touch.distance(centerOfWheel);
    
    if(distance <= colorWheelSize/2)
    {
        ofColor c = colorWheel.getColor(touch.x-positionOfWheel.x, touch.y-positionOfWheel.y);
        cout << touch.x-positionOfWheel.x << " " << touch.y-positionOfWheel.y << endl;
        cout << "Color: " << ofToString(c.r) << " " << c.g << " " << c.b << endl;
        
        redSlider.setValue(c.r);
        greenSlider.setValue(c.g);
        blueSlider.setValue(c.b);
    }
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){
    redSlider.update(touch);
    greenSlider.update(touch);
    blueSlider.update(touch);
}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){
    if(redSlider.newDataAvailable)
    {
        color.r = redSlider.getCurrentValue();
        hue.setLightState(30,true,color,0);
        //hue.setGroupState(2,true,color,0);
    }
    if(greenSlider.newDataAvailable)
    {
        color.g = greenSlider.getCurrentValue();
        hue.setLightState(30,true,color,0);
        //hue.setGroupState(2,true,color,0);
    }
    if(blueSlider.newDataAvailable)
    {
        color.b = blueSlider.getCurrentValue();
        hue.setLightState(30,true,color,0);
        //hue.setGroupState(2,true,color,0);
    }
    
    redSlider.isDragable = false;
    greenSlider.isDragable = false;
    blueSlider.isDragable = false;
}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){

}

//--------------------------------------------------------------
void ofApp::gotFocus(){

}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){

}
