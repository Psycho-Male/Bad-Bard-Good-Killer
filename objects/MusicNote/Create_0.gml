SetImageScale(GUISCALE);
spd=[1,2,3,4];
timer=0;
sustain=false;
sustain_scale=5;
sustain_pressed=false;
color=c_white;
function fail(){
    x-=spd[level];
    //Trace("Failed.");
    speed=.5*GUISCALE;
    direction=270;
    MiniGame.scr-=level*10;
    color=c_red;
    //MONEY-=level*100;
    //GetMoney(id,-level*100,5);
    //Destroy();
    state_current=state_fail;
}
function success(){
    x-=spd[level];
    //speed=.5*GUISCALE;
    //direction=90;
    //friction=.005*GUISCALE;
    var _pressDiff=abs((MiniGame.press_treshold+8)-x)*GUISCALE;
    var _maxTreshold=(MiniGame.press_treshold-MiniGame.fail_treshold)*GUISCALE;
    if sustain{
        var _percentage=100-((100/5)*sustain_scale);
    }else{
        var _percentage=(100/_maxTreshold)*_pressDiff;
    }
    Trace("_percentage: "+str(_percentage));
    MiniGame.scr+=(level*10+sustain*5)*_percentage;
    MONEY+=level*100;
    GetMoney(id,level*100,5);
    Destroy();
    //state_current=state_success;
}
function state_normal(){
    if !sustain_pressed{
        x-=spd[level];
    }
    if x<MiniGame.press_treshold&&IsDefined(KEY.pressed){
        if KEY.pressed==key{
            if sustain{
                sustain_pressed=true;
                state_current=state_sustain;
            }else{
                success();
            }
        }else{
            Trace("Wrong key.");
            fail();
        }
    }else if x<MiniGame.fail_treshold{
        fail();
    }
}
function state_success(){
    if timer>60{
        Destroy();
    }
    timer++;
    image_alpha-=.02;
}
function state_fail(){
    speed+=.005;
    image_alpha-=.02;
    if y>Camera.gui_h/2||image_alpha<=0{
        Destroy();
    }
}
function state_sustain(){
    if sustain_pressed{
        if keyboard_check_released(key){
            sustain_pressed=false;
            success();
        }
        if sustain_scale>0{
            sustain_scale-=spd[level]/10;
        }else{
            sustain_pressed=false;
            success();
        }
    }else{
        sustain_pressed=false;
        fail();
    }
}
function state_main_menu(){
}
if room==rm_main_menu{
    state_current=state_main_menu;
}else{
    state_current=state_normal;
}
