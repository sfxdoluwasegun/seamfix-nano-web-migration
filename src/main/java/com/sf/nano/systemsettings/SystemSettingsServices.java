package com.sf.nano.systemsettings;

import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;

import com.nano.jpa.entity.ras.BorrowableAmount;
import com.sf.nano.tools.QueryManager;

@Stateless
public class SystemSettingsServices {

//	@Inject
	private QueryManager queryManager;
	
	
	public List<BorrowableAmount> getBorrowableAmountList() {
		// TODO Auto-generated method stub
		List<BorrowableAmount> borrowableAmounts = queryManager.getBorrowableAmountList();

		// log.info("borrowableAmounts "+borrowableAmounts);

		return borrowableAmounts;
	}
	
}


