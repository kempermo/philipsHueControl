#include "ofMain.h"

#ifndef Slider_h
#define Slider_h

class slider{
    
    public:
        void setup(string name, ofVec2f position, ofVec2f size, int touchArea, int startvalue);
        void dragAble(ofVec2f);
        void update(ofVec2f touchPoint);
        void draw();
        void setValue(unsigned char value);
    
        int getCurrentValue();
    
        string name;
        ofVec2f position;
        ofVec2f size;
        int touchArea;
        int currentValue;
    
        bool isDragable;
        bool newDataAvailable;
    
    private:
        #define LOWER_VALUE 0
        #define UPPER_VALUE 255
    
        ofTrueTypeFont myfont;
    
        void drawStringCentered(string s, float x, float y);
    
    ofVec2f getOffset(string s);
};

#endif
