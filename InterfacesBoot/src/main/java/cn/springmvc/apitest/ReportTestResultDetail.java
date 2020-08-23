package cn.springmvc.apitest;

import cn.springmvc.model.TestCase;
import cn.springmvc.model.TestResultDetail;

/**
 * 数据扩展
 * @author pc
 *
 */
public class ReportTestResultDetail extends TestResultDetail{
	
	private static final long serialVersionUID = 8311254426819244683L;
	private TestCase testCase;
	
	public TestCase getTestCase() {
		return testCase;
	}
	public void setTestCase(TestCase testCase) {
		this.testCase = testCase;
	}
	
	


}
