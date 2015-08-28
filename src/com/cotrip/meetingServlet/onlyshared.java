package com.cotrip.meetingServlet;

import com.cotrip.bean.TravelPlan;

public class onlyshared {
  
	public boolean isshared(TravelPlan TravelPlan,String userID){
		String shared=TravelPlan.getShared();
		if(shared!=null){
		String[] IDS=shared.split(",");		
		for(int i=0;i<IDS.length;i++){
			 if(IDS[i].equals(userID)){
				 return true;
			 }
		  }
		}
		return false;
	}
}
