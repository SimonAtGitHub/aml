package com.ist.aml.report.dto;

import java.io.Serializable;

public class T07_case_feature implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2038953765894349585L;
	/** 案例编号 */
	private String application_num ="";
	/** 累计流入金额  */
	private Double totalamt_in = null;
	private String totalamt_in_str ="";
	/** 累计流出金额  */
	private Double totalamt_out = null;
	private String totalamt_out_str ="";
	/** 累计流入笔数 */
	private Integer totalcount_in= new Integer(0);
	private String totalcount_in_str ="";
	/** 累计流出笔数 */
	private Integer totalcount_out = new Integer(0);
	private String totalcount_out_str ="";
	/** 方向 */
	private String direction ="";
	/** 净额 */
	private Double netamt = null;
	private String netamt_str ="";
	/** 流入集中度 */
	private Double avgamt_in = null;
	private String avgamt_in_str ="";
	/** 流出集中度 */
	private Double avgamt_out = null;
	private String avgamt_out_str ="";
	/** 集中度  */
	private Double avgamt = null;
	private String avgamt_str ="";
	/** 流入速度 */
	private Double speed_in = null;
	private String speed_in_str ="";
	/** 流出速度 */
	private Double speed_out = null;
	private String speed_out_str ="";
	/** 流速 */
	private Double speed = null;
	private String speed_str ="";
	
	 /**                   
     * 构造函数           
     */                   
    public T07_case_feature() {    
    }

	public String getApplication_num() {
		return application_num;
	}

	public void setApplication_num(String applicationNum) {
		application_num = applicationNum;
	}

	public Double getTotalamt_in() {
		return totalamt_in;
	}

	public void setTotalamt_in(Double totalamtIn) {
		totalamt_in = totalamtIn;
	}

	public String getTotalamt_in_str() {
		return totalamt_in_str;
	}

	public void setTotalamt_in_str(String totalamtInStr) {
		totalamt_in_str = totalamtInStr;
	}

	public Double getTotalamt_out() {
		return totalamt_out;
	}

	public void setTotalamt_out(Double totalamtOut) {
		totalamt_out = totalamtOut;
	}

	public String getTotalamt_out_str() {
		return totalamt_out_str;
	}

	public void setTotalamt_out_str(String totalamtOutStr) {
		totalamt_out_str = totalamtOutStr;
	}

	public Integer getTotalcount_in() {
		return totalcount_in;
	}

	public void setTotalcount_in(Integer totalcountIn) {
		totalcount_in = totalcountIn;
	}

	public String getTotalcount_in_str() {
		return totalcount_in_str;
	}

	public void setTotalcount_in_str(String totalcountInStr) {
		totalcount_in_str = totalcountInStr;
	}

	public Integer getTotalcount_out() {
		return totalcount_out;
	}

	public void setTotalcount_out(Integer totalcountOut) {
		totalcount_out = totalcountOut;
	}

	public String getTotalcount_out_str() {
		return totalcount_out_str;
	}

	public void setTotalcount_out_str(String totalcountOutStr) {
		totalcount_out_str = totalcountOutStr;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public Double getNetamt() {
		return netamt;
	}

	public void setNetamt(Double netamt) {
		this.netamt = netamt;
	}

	public String getNetamt_str() {
		return netamt_str;
	}

	public void setNetamt_str(String netamtStr) {
		netamt_str = netamtStr;
	}

	public Double getAvgamt_in() {
		return avgamt_in;
	}

	public void setAvgamt_in(Double avgamtIn) {
		avgamt_in = avgamtIn;
	}

	public String getAvgamt_in_str() {
		return avgamt_in_str;
	}

	public void setAvgamt_in_str(String avgamtInStr) {
		avgamt_in_str = avgamtInStr;
	}

	public Double getAvgamt_out() {
		return avgamt_out;
	}

	public void setAvgamt_out(Double avgamtOut) {
		avgamt_out = avgamtOut;
	}

	public String getAvgamt_out_str() {
		return avgamt_out_str;
	}

	public void setAvgamt_out_str(String avgamtOutStr) {
		avgamt_out_str = avgamtOutStr;
	}

	public Double getAvgamt() {
		return avgamt;
	}

	public void setAvgamt(Double avgamt) {
		this.avgamt = avgamt;
	}

	public String getAvgamt_str() {
		return avgamt_str;
	}

	public void setAvgamt_str(String avgamtStr) {
		avgamt_str = avgamtStr;
	}

	public Double getSpeed_in() {
		return speed_in;
	}

	public void setSpeed_in(Double speedIn) {
		speed_in = speedIn;
	}

	public String getSpeed_in_str() {
		return speed_in_str;
	}

	public void setSpeed_in_str(String speedInStr) {
		speed_in_str = speedInStr;
	}

	public Double getSpeed_out() {
		return speed_out;
	}

	public void setSpeed_out(Double speedOut) {
		speed_out = speedOut;
	}

	public String getSpeed_out_str() {
		return speed_out_str;
	}

	public void setSpeed_out_str(String speedOutStr) {
		speed_out_str = speedOutStr;
	}

	public Double getSpeed() {
		return speed;
	}

	public void setSpeed(Double speed) {
		this.speed = speed;
	}

	public String getSpeed_str() {
		return speed_str;
	}

	public void setSpeed_str(String speedStr) {
		speed_str = speedStr;
	}

    
}
