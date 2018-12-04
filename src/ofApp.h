#pragma once

#include "ofxiOS.h"
#include "ofxPhilipsHue.h"
#include "Slider.h"

class ofApp : public ofxiOSApp {
	
    public:
        void setup();
        void update();
        void draw();
        void exit();
	
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);

        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);
        
        ofxPhilipsHue hue;
    
        slider redSlider;
        slider greenSlider;
        slider blueSlider;
    
        ofColor color;
    
        ofImage colorWheel;
        ofVec2f positionOfWheel;
        ofVec2f centerOfWheel;
        float colorWheelSize;
};


