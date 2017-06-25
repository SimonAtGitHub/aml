package com.ist.server.cal.aml.dowjons.bo;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;

import com.ist.common.LogUtils;
import com.ist.common.database.dbfunc.DBfunc;
import com.ist.common.database.dbfunc.DBfuncFactory;
import com.ist.common.util.DateUtils;
import com.ist.common.util.StringUtils;
import com.ist.server.cal.aml.common.Constants;

public class PaseDowjonsBo
{
	private static Logger logger = LogUtils.getLogger(PaseDowjonsBo.class
			.getName());

	public PaseDowjonsBo()
	{

	}

	public String getSqlParse(String sql, String caldate, String  roster_table,  String granularitys)
	{
		HashMap map = new HashMap();
		ArrayList paraList = new ArrayList();

		String returnSql = sql.toLowerCase();
		
		String rowStr = returnSql.substring(returnSql.indexOf("select")+6, returnSql.indexOf("from"));
		String ROSTER_TABLE = roster_table;
		String insertSql = "insert into "+ROSTER_TABLE;
		
		String icols = "";
		String[] colsArr = rowStr.split(",");
		for (String colsStr : colsArr)
		{
			String [] colArr = colsStr.split("as");
			
			for (int i=0;i<colArr.length; i++)
			{
				if(i%2!=0)
				{
					
					icols+=colArr[i]+",";
				}
			}
		}
		
		
		
		try
		{
			ArrayList list = new ArrayList();

			String regEx = "@\\s*((date)|(granularitys)|(predate)|(nextdate)){1}\\s*\\w*\\s*\\([^)]+\\)\\s*@";
			Pattern p = Pattern.compile(regEx, 2);
			Matcher matcher = p.matcher(sql);
			StringBuffer sb = new StringBuffer();

			while (matcher.find())
			{
				String s = matcher.group();
				String svalue = (String) doParaString(s, caldate, granularitys);
				matcher.appendReplacement(sb, svalue);

				list.add(s);
			}
			matcher.appendTail(sb);

			sql = sb.toString();
			insertSql=insertSql+"("+icols.subSequence(0, icols.length()-1)+") ("+sql+")";

			
		} catch (Exception ex)
		{
			ex.printStackTrace();
		}


		return insertSql;
	}

	public String replaceStr(String returnSql, String caldate, String oldstr)
	{
		Date curr = DateUtils.stringToDateShort(caldate);
		String day = DateUtils.getDay(curr);
		DateUtils db = new DateUtils();
		String newstr = DateUtils.dateToStringShort(db.getMonthBegin(db
				.getDateChangeTime(curr, "m", 1)));
		String nextmonthend = db.dateToStringShort(db.getMonthEnd(db
				.stringToDateShort(newstr)));
		String nextmonthbegin = db.dateToStringShort(db.getMonthBegin(db
				.stringToDateShort(newstr)));
		String currmonthend = db.dateToStringShort(db.getMonthEnd(db
				.stringToDateShort(caldate)));
		if (day.equals("10"))
		{
			newstr = "TO_DATE('" + nextmonthbegin + "'),'YYYY-MM-DD')"
					+ " AND TO_DATE('" + newstr.substring(0, 8)
					+ "10','YYYY-MM-DD')";
			returnSql = StringUtils.strReplace(returnSql, oldstr, newstr);
		}
		if (day.equals("20"))
		{
			newstr = "TO_DATE('" + newstr.substring(0, 8)
					+ "11'),'YYYY-MM-DD')" + " AND TO_DATE('"
					+ newstr.substring(0, 8) + "20','YYYY-MM-DD')";
			returnSql = StringUtils.strReplace(returnSql, oldstr, newstr);
		}
		if (caldate.equals(currmonthend))
		{
			newstr = "TO_DATE('" + newstr.substring(0, 8)
					+ "21'),'YYYY-MM-DD')" + " AND TO_DATE('" + nextmonthend
					+ "','YYYY-MM-DD')";
			returnSql = StringUtils.strReplace(returnSql, oldstr, newstr);

		}

		return returnSql;
	}

	public String getSqlParse(String sql, String caldate, String  roster_table, String granularitys,
			HashMap mapvalue)
	{
		logger.debug("tag mapvalue===" + mapvalue + "granularitys==="+granularitys);

		if (mapvalue != null)
		{
			Iterator itor = mapvalue.keySet().iterator();
			while (itor.hasNext())
			{
				String key = (String) itor.next();
				if (key != null)
				{
					String value = (String) mapvalue.get(key);
					if (value != null)
					{
						sql = StringUtils.strReplace(sql, key, value);
					}
				}
			}
		}
		return getSqlParse(sql, caldate, roster_table, granularitys);
	}

	public static Object doParaString(String paraString, String caldate,
			String granularitys)
	{
		DBfunc func = DBfuncFactory.getDBInstance();
		Object obj = new Object();

		String regEx_date = "@\\s*date\\s*\\(\\s*";
		String regEx_dateadd = "@\\s*dateadd\\s*\\(\\s*";
		String regEx_datebegin = "@\\s*datebegin\\s*\\(\\s*";
		String regEx_dateend = "@\\s*dateend\\s*\\(\\s*";
		String regEx_predateend = "@\\s*predateend\\s*\\(\\s*";

		String regEx_granularitys = "@\\s*granularitys\\s*\\(\\s*";
		String regEx_nextdateend = "@\\s*nextdateend\\s*\\(\\s*";

		String splitStr = "'";

		boolean flag = false;

		String returnString = caldate;

		String[] a = StringUtils.split(paraString, splitStr);

		if ((a != null) && (a.length > 2))
		{
			if ((a[1] != null) && (a[1].length() == 10)
					&& (a[1].indexOf("-") > 0))
			{
				returnString = a[1];
			} else
			{
				
				returnString = caldate;
			}

		}
		System.out.println(isRegex(paraString, regEx_date));

		if (!isRegex(paraString, regEx_date))
		{
			if (isRegex(paraString, regEx_dateadd))
			{
				int x = 0;

				if ((a != null) && (a.length > 4) && (a[3] != null))
					try
					{
						x = Integer.parseInt(a[3], 10);
					} catch (Exception localException)
					{
					}
				returnString = new DateUtils().getDateChangeALL(returnString, granularitys, x);
				logger.info(returnString);
			} else if (isRegex(paraString, regEx_datebegin))
			{
				int x = 0;

				if ((a != null) && (a.length > 4) && (a[3] != null))
				{
					try
					{
						x = Integer.parseInt(a[3], 10);
					} catch (Exception localException1)
					{
					}
					granularitys = String.valueOf(x);
				}

				returnString = new DateUtils().getBeginDate(granularitys,
						returnString);
			} else if (isRegex(paraString, regEx_dateend))
			{
				int x = 0;

				if ((a != null) && (a.length > 4) && (a[3] != null))
				{
					try
					{
						x = Integer.parseInt(a[3], 10);
					} catch (Exception localException2)
					{
					}
					granularitys = String.valueOf(x);
				}

				returnString = new DateUtils().getEndDate(granularitys,
						returnString);
			} else if (isRegex(paraString, regEx_predateend))
			{
				int x = 0;

				if ((a != null) && (a.length > 4) && (a[3] != null))
				{
					try
					{
						x = Integer.parseInt(a[3], 10);
					} catch (Exception localException3)
					{
					}
					granularitys = String.valueOf(x);
				}

				returnString = new DateUtils().getPreEndDate(granularitys,
						returnString);
			} else if (isRegex(paraString, regEx_nextdateend))
			{
				int x = 0;

				if ((a != null) && (a.length > 4) && (a[3] != null))
				{
					try
					{
						x = Integer.parseInt(a[3], 10);
					} catch (Exception localException3)
					{
					}

				}

				returnString = new DateUtils().getNextEndDate(granularitys,
						returnString, x);
			} else if (isRegex(paraString, regEx_granularitys))
			{
				flag = true;
			}
		}
		if (flag)
		{
			obj = granularitys;
		} else
		{
			obj = func.vch2dt(returnString, "yyyy-mm-dd");
		}
		return obj;
	}

	public static boolean isRegex(String s, String regEx)
	{
		try
		{
			Pattern p = Pattern.compile(regEx, 2);
			Matcher m = p.matcher(s);
			return m.find();
		} catch (Exception ex)
		{
			ex.printStackTrace();
		}
		return false;
	}

	

}
