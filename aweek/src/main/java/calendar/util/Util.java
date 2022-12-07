package calendar.util;

import java.util.List;

public class Util {
	
	//토요일과 일요일을 확인하여 "blue"혹은 "red" 문자열 반환하는 메서드
	public static String fontColor(int dayOfWeek, int i){
		String color ="";
		if((dayOfWeek-1+i)%7==0){
			color="blue"; //개행
		}else if((dayOfWeek-1+i)%7==1){
			color="red";
		}else{
			color="black";
		}
	return color;
	}
	
	
}
