public class LeaveTriggerHandler {
    
    public void populateEmployeeLeave(List<Leave__c> lstLeave){
        map<Id,Leave__c> mapLeave = new map<Id,Leave__c>();
        for(Leave__c leaveObj :lstLeave) {
            mapLeave.put(leaveObj.Employee__c,leaveObj);
        }
        if(mapLeave.size()>0) {
            list<Employee_Leave__c> listEmpLeave = [Select Id,Employee__c,Employee__r.Id,Marraige_Leave__c,Sick_Leave__c,Diwali_Leave__c from Employee_Leave__c where Employee__r.Id IN :mapLeave.keyset()];
            if(listEmpLeave.size()>0) {
                for(Employee_Leave__c emp : listEmpLeave) {
                    if(emp.Sick_Leave__c !=null || emp.Diwali_Leave__c !=null || emp.Marraige_Leave__c !=null) {
                        mapLeave.get(emp.Employee__r.Id).Employee_Leave__c = emp.Id;
                        
                        if(mapLeave.get(emp.Employee__r.Id).Leave_Type__c == 'Sick Leave') {
                            if(mapLeave.get(emp.Employee__r.Id).No_of_Days__c <= emp.Sick_Leave__c) {
                                emp.Sick_Leave__c = emp.Sick_Leave__c - mapLeave.get(emp.Employee__r.Id).No_of_Days__c;
                                if(emp.Sick_Leave__c < 0) {
                                    mapLeave.get(emp.Employee__r.Id).addError('No of sick leaves entered are more than actual balance');
                                }
                            }
                            else {
                                mapLeave.get(emp.Employee__r.Id).addError('No of sick leaves entered are more than actual balance');
                            }
                        }
                        if(mapLeave.get(emp.Employee__r.Id).Leave_Type__c == 'Marriage Leave') {
                            if(mapLeave.get(emp.Employee__r.Id).No_of_Days__c <= emp.Marraige_Leave__c) {
                                emp.Marraige_Leave__c = emp.Marraige_Leave__c - mapLeave.get(emp.Employee__r.Id).No_of_Days__c;
                                if(emp.Marraige_Leave__c < 0) {
                                    mapLeave.get(emp.Employee__r.Id).addError('No of Marraige leaves entered are more than actual balance');
                                }
                            }
                            else {
                                mapLeave.get(emp.Employee__r.Id).addError('No of Marraige leaves entered are more than actual balance');
                            }
                        }
                        if(mapLeave.get(emp.Employee__r.Id).Leave_Type__c == 'Diwali Leave') {
                            if(mapLeave.get(emp.Employee__r.Id).No_of_Days__c <= emp.Diwali_Leave__c) {
                                emp.Diwali_Leave__c = emp.Diwali_Leave__c - mapLeave.get(emp.Employee__r.Id).No_of_Days__c;
                                if(emp.Diwali_Leave__c < 0) {
                                    mapLeave.get(emp.Employee__r.Id).addError('No of Diwali leaves entered are more than actual balance');
                                }
                            }
                            else  {
                                mapLeave.get(emp.Employee__r.Id).addError('No of Diwali leaves entered are more than actual balance');
                            }
                        } 
                    }
                } 
            }
            update listEmpLeave;   
        }
    }
}