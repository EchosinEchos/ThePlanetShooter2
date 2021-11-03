shader_type canvas_item;

uniform float percent : hint_range(0, 1) = 0.15;
const float nb_oscil = 5.;
const float  TWO_PI = 6.28318530718;

const float nb_oscil_time_x = 1.5;
const float nb_oscil_time_y = 0.1;

const float R = .8;

void fragment(){
	
	//float cpercent = percent * abs(sin(TIME));
	//if(UV.y - cpercent <= 0.){
	float l = length(vec2(UV.y-R, UV.x-0.5));
	if (l > R-abs(sin(TIME*TWO_PI*nb_oscil_time_y))*percent*(1.+(sin(UV.x*nb_oscil*TWO_PI-TIME*TWO_PI*nb_oscil_time_x)))/2.){
		//if(sin((UV.x - TIME * nb_oscil_time_x)*nb_oscil*TWO_PI) > (2.*UV.y/cpercent -1.)){
		//if(abs(l-R) > 7.*abs(sin(TIME))){
		COLOR.a = 0.;
		//}
	}
}
