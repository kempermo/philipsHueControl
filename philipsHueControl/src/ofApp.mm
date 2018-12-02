#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){	
    hue.setup("192.168.0.53", "cKIghy-7fLi6HK9KuseNX4GLYQWyqyL-1QV45BOR");
    
    //Prepare Interface
    redSlider.setup("Rot", ofVec2f(60,500), ofVec2f(ofGetScreenWidth()-120,30), 75, 0);
    greenSlider.setup("Grün", ofVec2f(60,650), ofVec2f(ofGetScreenWidth()-120,30), 75, 0);
    blueSlider.setup("Blau", ofVec2f(60,800), ofVec2f(ofGetScreenWidth()-120,30), 75, 0);
    
    color.r = 0;
    color.g = 0;
    color.b = 0;
}

//--------------------------------------------------------------
void ofApp::update(){
    if(redSlider.newDataAvailable)
    {
        color.r = redSlider.getCurrentValue();
        hue.setLightState(3,true,color,0);
    }
    if(greenSlider.newDataAvailable)
    {
        color.g = greenSlider.getCurrentValue();
        hue.setLightState(3,true,color,0);
    }
    if(blueSlider.newDataAvailable)
    {
        color.b = blueSlider.getCurrentValue();
        hue.setLightState(3,true,color,0);
    }
}

//--------------------------------------------------------------
void ofApp::draw(){
    ofSetBackgroundColor(0, 0, 0);
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
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){
    redSlider.update(touch);
    greenSlider.update(touch);
    blueSlider.update(touch);
}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){
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
