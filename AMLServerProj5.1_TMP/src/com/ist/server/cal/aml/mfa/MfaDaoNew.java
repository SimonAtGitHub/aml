package com.ist.server.cal.aml.mfa;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.apache.log4j.Logger;

import com.ist.common.LogUtils;
import com.ist.common.database.SQLExecute;
import com.ist.common.database.dbfunc.DBfunc;
import com.ist.common.database.dbfunc.DBfuncFactory;
import com.ist.common.properties.SysConfig;
import com.ist.common.util.DateUtils;
import com.ist.server.cal.aml.alertExpand.dto.T01_function_param;
import com.ist.server.cal.aml.common.Constants;

public class MfaDaoNew {

	private static Logger logger = LogUtils.getLogger(MfaDaoNew.class.getName());

	private DBfunc func = DBfuncFactory.getDBInstance();
	private StringBuffer sql = null;
	private String dbtype = SysConfig.getProperty("database.dbtype");

	/**
	 * 往中间表插入当天的交易
	 * 
	 * @param conn
	 * @param statisticdate数据日期
	 * @throws Exception
	 */
	public void insertT47_transaction_mfa_d(Connection conn, String statisticdate) throws SQLException {
		// 插入当天预警交易
		SQLExecute.exeSql(conn, func.deleteTable("M13_trans_mid"));
		sql = new StringBuffer();
		sql.append(" INSERT /*+ parallel(4) append nologging */ INTO M13_trans_mid (TRANSACTIONKEY,ALERT_DT) ");
		sql.append(" select t.transactionkey,t.ALERT_DT from(select distinct transactionkey,ALERT_DT from t27_alert_trans a ");
		sql.append(" where a.ALERT_DT=" + func.vch2dt(statisticdate, "yyyy-MM-dd"));
		sql.append(" and a.pbckeytype in('2','3') ) t  left join m13_net_trans_keep k on   t.transactionkey = k.transactionkey where k.transactionkey is null");
		SQLExecute.exeSql(conn, sql.toString());
		conn.commit();

		// 插入需要重算的预警交易
		SQLExecute.exeSql(conn, func.deleteTable("M13_trans_mid_union"));
		sql = new StringBuffer();
		sql.append(" INSERT /*+ parallel(4) append nologging */ INTO M13_trans_mid_union (TRANSACTIONKEY,ALERT_DT) ");
		sql.append(" select transactionkey,ALERT_DT from M13_trans_mid  ");
		sql.append(" union ");
		sql.append(" select transactionkey,ALERT_DT from T3X_TRANS_MID_RE  a where not exists(select 'x' from M13_trans_mid  b where b.transactionkey=a.transactionkey)");
		SQLExecute.exeSql(conn, sql.toString());
		conn.commit();

		
		/**查询进入资金网络的sql交易片段
		 * Date:2017-04-22
		 * auther:majx
		 */
		String sql_capital_trans = "";
		String sql_trans  = "select str_sql from t23_capital_trans";
		ArrayList list = SQLExecute.executeQuery(conn, sql_trans);
		if(list != null && list.size() > 0){
			StringBuffer sql_transSb = new StringBuffer();
			for (Object obj : list) {
				String str_sql = obj.toString();
				
				String sql_query = str_sql.substring(str_sql.indexOf("where") +5,str_sql.length()-1);
				sql_transSb.append(" and ");
				sql_transSb.append(sql_query);
			}
			sql_capital_trans = sql_transSb.toString();
		}
		
		// 清理中间表
		SQLExecute.exeSql(conn, func.deleteTable("T47_TRANSACTION_MFA_D"));

		sql = new StringBuffer();
		sql.append(" INSERT /*+ parallel(4) append nologging */ INTO T47_TRANSACTION_MFA_D  ");
		sql.append(" (TRANSACTIONKEY,CB_PK,TX_NO,VOUCHER_NO,ORGANKEY,TX_DT,DT_TIME,ACCT_NUM,PARTY_ID,PARTY_CLASS_CD, ");
		sql.append(" TX_CD,CB_TX_CD,BUS_TYPE_CD,TX_TYPE_CD,DEBIT_CREDIT,RECEIVE_PAY_CD,SUBJECTNO,CURRENCY_CD, ");
		sql.append(" CURR_CD,AMT,CNY_AMT,USD_AMT,AMT_VAL,CASH_TRANS_FLAG,REMIT_TYPE_CD,DES,OVERAREA_IND, ");
		sql.append(" SETTLE_TYPE_CD,USE_DES,OPP_SYS_ID,OPP_ISPARTY,OPP_AREA,OPP_ORGAN_TYPE,OPP_ORGANKEY, ");
		sql.append(" OPP_ORGANNAME,OPP_PARTY_ID,OPP_NAME,OPP_ACCT_NUM,OPP_TX_DT,OPP_ACCT_TYPE_CD,OPP_CARD_TYPE, ");
		sql.append(" OPP_CARD_NO,OPP_PARTY_CLASS_CD,CANCEL_IND,AMT_CD,BATCH_IND,TELLER,RE_IND,HANDLE_STATUS_CD, ");
		sql.append(" PARTY_CHN_NAME,ADDTIONAL,RE_DT,TX_DIRECT,TOKEN_NO,HOST_CUST_ID,CHANNEL,CAL_IND,RULE_IND, ");
		sql.append(" TEMP1,OPP_COUNTRY,TSCTKEY,TX_GO_COUNTRY,TX_GO_AREA,TX_OCCUR_COUNTRY,TX_OCCUR_AREA,AGENT_NAME, ");
		sql.append(" AGENT_CARD_TYPE,AGENT_CARD_NO,AGENT_COUNTRY,ORG_TRANS_RELA,CASH_IND,OPP_PBC_PARTY_CLASS_CD, ");
		sql.append(" CHECK_TELLER,LAST_UPD_USR,OPP_OFF_SHORE_IND,BIZ_TYPE_CD,VALIDATE_IND,VALIDATE_IND2,ALERT_DT) ");
		sql.append(" SELECT T.TRANSACTIONKEY,CB_PK,TX_NO,VOUCHER_NO,ORGANKEY,TX_DT,DT_TIME,ACCT_NUM,PARTY_ID,PARTY_CLASS_CD, ");
		sql.append(" TX_CD,CB_TX_CD,BUS_TYPE_CD,TX_TYPE_CD,DEBIT_CREDIT,RECEIVE_PAY_CD,SUBJECTNO,CURRENCY_CD, ");
		sql.append(" CURR_CD,AMT,CNY_AMT,USD_AMT,AMT_VAL,CASH_TRANS_FLAG,REMIT_TYPE_CD,DES,OVERAREA_IND, ");
		sql.append(" SETTLE_TYPE_CD,USE_DES,OPP_SYS_ID,OPP_ISPARTY,OPP_AREA,OPP_ORGAN_TYPE,OPP_ORGANKEY, ");
		sql.append(" OPP_ORGANNAME,OPP_PARTY_ID,OPP_NAME,OPP_ACCT_NUM,OPP_TX_DT,OPP_ACCT_TYPE_CD,OPP_CARD_TYPE, ");
		sql.append(" OPP_CARD_NO,OPP_PARTY_CLASS_CD,CANCEL_IND,AMT_CD,BATCH_IND,TELLER,RE_IND,HANDLE_STATUS_CD, ");
		sql.append(" PARTY_CHN_NAME,ADDTIONAL,RE_DT,TX_DIRECT,TOKEN_NO,HOST_CUST_ID,CHANNEL,CAL_IND,RULE_IND, ");
		sql.append(" TEMP1,OPP_COUNTRY,TSCTKEY,TX_GO_COUNTRY,TX_GO_AREA,TX_OCCUR_COUNTRY,TX_OCCUR_AREA,AGENT_NAME, ");
		sql.append(" AGENT_CARD_TYPE,AGENT_CARD_NO,AGENT_COUNTRY,ORG_TRANS_RELA,CASH_IND,OPP_PBC_PARTY_CLASS_CD, ");
		sql.append(" CHECK_TELLER,LAST_UPD_USR,OPP_OFF_SHORE_IND,BIZ_TYPE_CD,VALIDATE_IND,VALIDATE_IND2,U.ALERT_DT ");
		sql.append(" FROM t47_TRANSACTION T ,M13_trans_mid_union u  ");
		sql.append(" WHERE t.transactionkey=u.transactionkey ");
		sql.append(" AND t.cal_ind = '1' ");
		sql.append(sql_capital_trans);
		SQLExecute.exeSql(conn, sql.toString());
	}

	public void reCal(Connection conn, String statisticdate) throws Exception {
		// 找出m13_net_trans_keep表中需要重算的网络
		SQLExecute.exeSql(conn, func.deleteTable("M13_net_mid"));
		sql = new StringBuffer();
		sql.append(" INSERT INTO M13_net_mid (net_id) ");
		sql.append(" select   k.net_id from m13_net_trans_keep k ");
		sql.append("  where k.alert_dt=" + func.vch2dt(statisticdate, "yyyy-MM-dd"));
		sql.append(" union  select   a.net_id from M13_net_mid_re a where a.statisticdate=" + func.vch2dt(statisticdate, "yyyy-MM-dd"));
		SQLExecute.exeSql(conn, sql.toString());

		// 插入需要重算的交易
		SQLExecute.exeSql(conn, func.deleteTable("M13_trans_mid_re"));
		sql = new StringBuffer();
		sql.append(" INSERT INTO M13_trans_mid_re (TRANSACTIONKEY,ALERT_DT) ");
		sql.append(" select transactionkey,ALERT_DT from M13_net_trans_day k ");
		sql.append(" where exists (select 1 from M13_net_mid r where r.net_id=k.net_id)");
		SQLExecute.exeSql(conn, sql.toString());

		// 删除多余的交易
		sql = new StringBuffer();
		sql.append(" delete from M13_trans_mid_re ");
		sql.append("  where alert_dt=" + func.vch2dt(statisticdate, "yyyy-MM-dd"));
		SQLExecute.exeSql(conn, sql.toString());

		// 删除需要重算的网络
		sql = new StringBuffer();
		sql.append(" delete from  m13_net_trans_keep k ");
		sql.append(" where exists (select 1 from M13_net_mid r where r.net_id=k.net_id) ");
		SQLExecute.exeSql(conn, sql.toString());

		sql = new StringBuffer();
		sql.append(" delete from  m13_net_acct_keep k ");
		sql.append(" where exists (select 1 from M13_net_mid r where r.net_id=k.net_id) ");
		SQLExecute.exeSql(conn, sql.toString());
	}

	/**
	 * 当天所有转账交易
	 * 
	 * @param conn
	 * @throws Exception
	 */
	public void insertM47_transaction_d_acct(Connection conn) throws Exception {

		SQLExecute.exeSql(conn, func.deleteTable("M47_transaction_d_acct"));
		sql = new StringBuffer();
		sql.append(" Insert /*+ parallel(4) append nologging */ Into M47_transaction_d_acct (                     ");
		sql.append("     recordid,party_id,opp_party_id                                                           ");
		sql.append(" )                                                                                            ");
		sql.append(" select                                                                                       ");
		sql.append("     t2.union_objkey,t2.objkey,t2.opp_objkey                                                  ");
		sql.append(" from (                                                                                       ");
		sql.append("     select                                                                                   ");
		sql.append("         row_number() over(partition by union_objkey order by t1.objkey) as row_num,          ");
		sql.append("         t1.union_objkey,                                                                     ");
		sql.append("         t1.objkey,                                                                           ");
		sql.append("         t1.opp_objkey                                                                        ");
		sql.append("     from (                                                                                   ");
		sql.append("         select                                                                               ");
		sql.append("             case when t.party_id < t.opp_party_id then t.party_id || ',' || t.opp_party_id   ");
		sql.append("                  else t.opp_party_id || ',' || t.party_id                                    ");
		sql.append("             end as union_objkey,                                                             ");
		sql.append("             t.party_id as objkey,                                                            ");
		sql.append("             t.opp_party_id as opp_objkey                                                     ");
		sql.append("         from                                                                                 ");
		sql.append("             T47_transaction_mfa_d t                                                          ");
		sql.append("         where                                                                                ");
		sql.append("             t.cash_trans_flag = '2'                                                          ");
		sql.append("         and                                                                                  ");
		sql.append("             t.opp_party_id is not null                                                       ");
		sql.append("         ) t1                                                                                 ");
		sql.append("     ) t2                                                                                     ");
		sql.append(" where                                                                                        ");
		sql.append("     t2.row_num = 1                                                                           ");
		SQLExecute.exeSql(conn, sql.toString());
	}

	/**
	 * 构建初始网络:
	 * 
	 * @param conn
	 * @throws Exception
	 */
	public void insertTmp_net_acct_muti(Connection conn) throws Exception {
		SQLExecute.exeSql(conn, func.deleteTable("tmp_net_acct_muti"));
		sql = new StringBuffer();
		sql.append(" insert /*+ parallel(4) append nologging */ into tmp_net_acct_muti (     ");
		sql.append("     net_id,acct_num,opp_acct_num,muti_acct_num                          ");
		sql.append(" )                                                                       ");
		// --主体方出现多次
		sql.append(" select                                                                  ");
		sql.append("     '1-'||dense_rank() over(order by t1.party_id) as net_id,            ");
		sql.append("     t1.party_id,                                                        ");
		sql.append("     t1.opp_party_id,                                                    ");
		sql.append("     '1'                                                                 ");
		sql.append(" from (                                                                  ");
		sql.append("     select                                                              ");
		sql.append("         count(t.opp_party_id) over(partition by t.party_id) as grp_obj, ");
		sql.append("         t.party_id,                                                     ");
		sql.append("         t.opp_party_id                                                  ");
		sql.append("     from                                                                ");
		sql.append("         M47_transaction_d_acct t                                        ");
		sql.append("     ) t1                                                                ");
		sql.append(" where                                                                   ");
		sql.append("     t1.grp_obj > 1                                                      ");
		sql.append(" union all                                                               ");
		// -- 对手方出现多次
		sql.append(" select                                                                  ");
		sql.append("     '2-'||dense_rank() over(order by t1.opp_party_id) as net_id,        ");
		sql.append("     t1.party_id,                                                        ");
		sql.append("     t1.opp_party_id,                                                    ");
		sql.append("     '2'                                                                 ");
		sql.append(" from (                                                                  ");
		sql.append("     select                                                              ");
		sql.append("         count(t.party_id) over(partition by t.opp_party_id) as grp_opp_obj, ");
		sql.append("         t.party_id,                                                     ");
		sql.append("         t.opp_party_id                                                  ");
		sql.append("     from                                                                ");
		sql.append("         M47_transaction_d_acct t                                        ");
		sql.append("     ) t1                                                                ");
		sql.append(" where                                                                   ");
		sql.append("     t1.grp_opp_obj > 1                                                  ");
		SQLExecute.exeSql(conn, sql.toString());
		conn.commit();

		sql.setLength(0); // 清空对象
		sql.append(" insert /*+ parallel(4) append nologging */ into tmp_net_acct_muti (      ");
		sql.append("     net_id,acct_num,opp_acct_num,muti_acct_num                           ");
		sql.append(" )                                                                        ");
		// -- 上述两种情况之外
		sql.append(" select                                                                   ");
		sql.append("     '3-'||dense_rank() over(order by t.party_id) as net_id,              ");
		sql.append("     t.party_id,                                                          ");
		sql.append("     t.opp_party_id,                                                      ");
		sql.append("     '3'                                                                  ");
		sql.append(" from                                                                     ");
		sql.append("     M47_transaction_d_acct t                                             ");
		sql.append("     left join tmp_net_acct_muti t1                                       ");
		sql.append("         on (t.party_id = t1.acct_num and t1.muti_acct_num = '1')         ");
		sql.append("     left join tmp_net_acct_muti t2                                       ");
		sql.append("         on (t.opp_party_id = t2.opp_acct_num and t2.muti_acct_num = '2') ");
		sql.append(" where                                                                    ");
		sql.append("     t1.net_id is null                                                    ");
		sql.append(" and                                                                      ");
		sql.append("     t2.net_id is null                                                    ");
		SQLExecute.exeSql(conn, sql.toString());
		conn.commit();
	}

	/**
	 * 生成网络对象关系
	 * 
	 * @param conn
	 * @throws Exception
	 */
	public void insertTmp_net_acct(Connection conn) throws Exception {
		func.deleteTable(conn, "tmp_net_acct");
		sql = new StringBuffer();
		sql.append(" Insert /*+ parallel(4) append nologging */ into tmp_net_acct(net_id,acct_num,flag) ");
		sql.append(" Select t1.net_id,t1.acct_num,'1' From tmp_net_acct_muti t1 ");
		sql.append(" Union ");
		sql.append(" SELECT t2.net_id,t2.opp_acct_num,'1' From tmp_net_acct_muti t2 ");
		SQLExecute.exeSql(conn, sql.toString());
	}

	/**
	 * 合并网络 当网络中，每个对象均只存在于两个网络,且网络下对象较多，按照网络ID逐个网络合并
	 * 其他情况，优先合并一个对象出现在多个网络的数据
	 * 
	 * 2015-07-29 优化处理算法
	 */
	public void mergeNet(Connection conn, String statisticdate) throws Exception {
		int batchNumber = 0; // 网络合并批次数
		int avgCountNet = 0; // 网络平均对象数
		int maxCountNet = 0; // 网络最大对象数
		int dataRows = 0; // 数据记录数

		StringBuffer sql = new StringBuffer(); // 用于拼接sql语句

		boolean unfinished = true; // 用于判断网络合并是否结束, true 表示未完成

		logger.info("资金网络合并开始...");

		while (unfinished) {
			batchNumber++;

			// 生成网络关系临时表
			SQLExecute.exeSql(conn, func.deleteTable("TMP_NET_RELA_MID"));

			sql.setLength(0); // 清空对象
			sql.append(" insert /*+ parallel(4) append nologging */ into tmp_net_rela_mid (                                ");
			sql.append("     new_net_id,net_id,objkey,count_net,count_obj,row_num                                          ");
			sql.append(" )                                                                                                 ");
			sql.append(" select                                                                                            ");
			sql.append("     t1.new_net_id,                                                                                ");
			sql.append("     t1.net_id,                                                                                    ");
			sql.append("     t1.objkey,                                                                                    ");
			sql.append("     t1.count_net,                                                                                 ");
			sql.append("     count(t1.objkey) over(partition by t1.net_id) as count_obj,                                   ");
			sql.append("     row_number() over(partition by t1.net_id order by t1.count_net desc,t1.new_net_id) as row_num ");
			sql.append(" from (                                                                                            ");
			sql.append("     select                                                                                        ");
			sql.append("         'N'||" + batchNumber + "||'-'||dense_rank() over(order by t.acct_num) as new_net_id,      ");
			sql.append("         count(t.net_id) over(partition by t.acct_num) as count_net,                               ");
			sql.append("         t.net_id,                                                                                 ");
			sql.append("         t.acct_num as objkey                                                                      ");
			sql.append("     from                                                                                          ");
			sql.append("         tmp_net_acct t,                                                                           ");
			sql.append("         (select t.acct_num from tmp_net_acct t group by t.acct_num having count(t.net_id) > 1) s  ");
			sql.append("     where                                                                                         ");
			sql.append("         t.acct_num = s.acct_num                                                                   ");
			sql.append("     ) t1                                                                                          ");
			dataRows = SQLExecute.exeSql(conn, sql.toString());
			conn.commit();

			sql.setLength(0); // 清空对象
			sql.append(" select                                            ");
			sql.append("     ceil(avg(t.count_net)) as avg_count_net,      ");
			sql.append("     max(t.count_obj) as max_count_net             ");
			sql.append(" from                                              ");
			sql.append("     tmp_net_rela_mid t                            ");
			ArrayList queryList = SQLExecute.executeQuery(conn, sql.toString());

			java.util.TreeMap dataMap = (java.util.TreeMap) queryList.get(0);
			avgCountNet = Integer.parseInt("".equals((String) dataMap.get("AVG_COUNT_NET")) ? "0" : (String) dataMap.get("AVG_COUNT_NET"));
			maxCountNet = Integer.parseInt("".equals((String) dataMap.get("MAX_COUNT_NET")) ? "0" : (String) dataMap.get("MAX_COUNT_NET"));

			// 根据数据情况生成网络关系
			// 当网络中，每个对象均只存在于两个网络,且网络下对象较多(暂定10以上)，按照网络ID逐个网络合并
			if (avgCountNet == 2 && maxCountNet >= 10) {
				logger.debug("特殊处理：网络下对象数较多,逐个网络合并 ");

				SQLExecute.exeSql(conn, func.deleteTable("TMP_NET_RELA"));

				sql.setLength(0); // 清空对象
				sql.append(" insert /*+ parallel(4) append nologging */ into tmp_net_rela (                                     ");
				sql.append("     acct_seq,net_id,flag                                                                           ");
				sql.append(" )                                                                                                  ");
				sql.append(" select                                                                                             ");
				sql.append("     'N'||" + batchNumber + "||'-'||dense_rank() over(order by t.objkey) as new_net_id,             ");
				sql.append("     t.net_id,                                                                                      ");
				sql.append("     ''                                                                                             ");
				sql.append(" from (                                                                                             ");
				sql.append("     select                                                                                         ");
				sql.append("         distinct t3.net_id,t1.net_id as objkey                                                     ");
				sql.append("     from                                                                                           ");
				sql.append("         tmp_net_rela_mid t1,                                                                       ");
				sql.append("         (select min(net_id) as net_id from tmp_net_rela_mid where count_obj = " + maxCountNet + ") t2, ");
				sql.append("         tmp_net_rela_mid t3                                                                        ");
				sql.append("     where                                                                                          ");
				sql.append("         t1.net_id = t2.net_id                                                                      ");
				sql.append("     and                                                                                            ");
				sql.append("         t1.objkey = t3.objkey                                                                      ");
				sql.append("     and                                                                                            ");
				sql.append("         t1.net_id != t3.net_id                                                                     ");
				sql.append("     union all                                                                                      ");
				sql.append("     select                                                                                         ");
				sql.append("         distinct t1.net_id,t2.net_id as objkey                                                     ");
				sql.append("     from                                                                                           ");
				sql.append("         tmp_net_rela_mid t1,                                                                       ");
				sql.append("         (select min(net_id) as net_id from tmp_net_rela_mid where count_obj = " + maxCountNet + ") t2  ");
				sql.append("     where                                                                                          ");
				sql.append("         t1.net_id = t2.net_id                                                                      ");
				sql.append("     ) t                                                                                            ");
				dataRows = SQLExecute.exeSql(conn, sql.toString());
				conn.commit();
			}
			// 其他情况,优先合并一个对象出现在多个网络的数据
			else {
				SQLExecute.exeSql(conn, func.deleteTable("TMP_NET_RELA"));

				sql.setLength(0); // 清空对象
				sql.append(" insert /*+ parallel(4) append nologging */ into tmp_net_rela (              ");
				sql.append("     acct_seq,net_id,flag                                                    ");
				sql.append(" )                                                                           ");
				sql.append(" select                                                                      ");
				sql.append("     t3.new_net_id,                                                          ");
				sql.append("     t3.net_id,                                                              ");
				sql.append("     ''                                                                      ");
				sql.append(" from (                                                                      ");
				sql.append("     select                                                                  ");
				sql.append("         t2.new_net_id,                                                      ");
				sql.append("         t2.net_id,                                                          ");
				sql.append("         t2.objkey,                                                          ");
				sql.append("         count(t2.net_id) over(partition by t2.new_net_id) as count_new_net  ");
				sql.append("     from                                                                    ");
				sql.append("         tmp_net_rela_mid t2                                                 ");
				sql.append("     where                                                                   ");
				sql.append("         t2.row_num = 1                                                      ");
				sql.append("     ) t3                                                                    ");
				sql.append(" where                                                                       ");
				sql.append("     t3.count_new_net > 1                                                    ");
				dataRows = SQLExecute.exeSql(conn, sql.toString());
				conn.commit();
			}

			// 没有需要合并的网络时，网络合并结束
			if (dataRows == 0) {
				unfinished = false;
				logger.info("资金网络合并完成,合并总批次数:" + (batchNumber - 1)); // 最后一次未作合并，所以实际批次数需要减一
				continue;
			}

			// 根据网络关系合并网络
			SQLExecute.exeSql(conn, func.deleteTable("TMP_NET_ACCT_MEGER"));

			sql.setLength(0); // 清空对象
			sql.append(" insert /*+ parallel(4) append nologging */ into tmp_net_acct_meger (    ");
			sql.append("     net_id,acct_num                                                     ");
			sql.append(" )                                                                       ");
			sql.append(" select                                                                  ");
			sql.append("     distinct                                                            ");
			sql.append("     case when t2.acct_seq is null then t1.net_id                        ");
			sql.append("          else t2.acct_seq                                               ");
			sql.append("     end as net_id,                                                      ");
			sql.append("     t1.acct_num                                                         ");
			sql.append(" from                                                                    ");
			sql.append("     tmp_net_acct t1                                                     ");
			sql.append("     left join tmp_net_rela t2                                           ");
			sql.append("         on (t1.net_id = t2.net_id)                                      ");
			SQLExecute.exeSql(conn, sql.toString());
			conn.commit();

			// 将合并后的网络回写
			SQLExecute.exeSql(conn, func.deleteTable("TMP_NET_ACCT"));

			sql.setLength(0); // 清空对象
			sql.append(" insert /*+ parallel(4) append nologging */ into tmp_net_acct (   ");
			sql.append("     net_id,acct_num                                              ");
			sql.append(" )                                                                ");
			sql.append(" select                                                           ");
			sql.append("     t.net_id,                                                    ");
			sql.append("     t.acct_num                                                   ");
			sql.append(" from                                                             ");
			sql.append("     tmp_net_acct_meger t                                         ");
			SQLExecute.exeSql(conn, sql.toString());
			conn.commit();

			logger.info("资金网络合并,当前批次数: " + batchNumber);
		}

		logger.info("资金网络合并结束...");
	}

	/**
	 * 写入之前保留的网络对象关系
	 * 
	 * @param conn
	 * @throws Exception
	 */
	public void insertTmp_net_acctKeep(Connection conn) throws Exception {
		sql = new StringBuffer();
		// 为了避免 net_id 合并时出现重复，重新生成
		sql.append(" insert /*+ parallel(4) append nologging */ into tmp_net_acct (                                ");
		sql.append("     net_id, acct_num                                                                          ");
		sql.append(" )                                                                                             ");
		sql.append(" select                                                                                        ");
		sql.append("     '4-'||dense_rank() over(order by t.net_id) as net_id,                                     ");
		sql.append("     t.acct_num                                                                                ");
		sql.append(" from                                                                                          ");
		sql.append("     m13_net_acct_keep t                                                                       ");
		
		SQLExecute.exeSql(conn, sql.toString());
	}

	/**
	 * 插入当天合并的网络并更新最小日期
	 * 
	 * @param conn
	 * @param statisticdate
	 * @throws Exception
	 */
	public void insertM13_net_acct_day(Connection conn, String statisticdate) throws Exception {

		SQLExecute.exeSql(conn, func.deleteTable("M13_net_acct_day"));
		sql = new StringBuffer();
		sql.append(" INSERT /*+ parallel(4) append nologging */ INTO M13_net_acct_day(net_id,acct_num,create_dt,flag) ");
		// 当天新生成的网络(当日新合成，但不一定是当日创建的)
		sql.append(" SELECT replace('" + statisticdate + "','-','')||case when length(t.net_id)>9 then SUBSTR(t.net_id,9) else t.net_id end, t.acct_num,");
		sql.append(" case when n.create_dt is null then " + func.vch2dt(statisticdate, "yyyy-MM-dd") + " else n.create_dt end,t.flag ");
		sql.append("   FROM tmp_net_acct t LEFT OUTER JOIN M13_net_acct_keep n ON (t.net_id = n.net_id and t.acct_num = n.acct_num) ");
        // delete by zk 20151214 新版本网络不需要关联log表，因为log表已不用了，所以删除union的sql
		//		sql.append(" UNION ");
//		// 未参与合并的存量网络
//		sql.append(" SELECT n.net_id,n.acct_num,n.create_dt,n.flag ");
//		sql.append("   FROM M13_net_acct_keep n LEFT OUTER JOIN T13_MFA_MODIFY_LOG g ON (n.net_id = g.n_net_id) ");
//		sql.append("  WHERE g.n_net_id IS NULL ");
		
		SQLExecute.exeSql(conn, sql.toString());
		System.out.println("aaaaaaaaaaaaaaaa"+sql.toString());
	}

	/**
	 * 将当天网络中的交易保存出来
	 * 
	 * @param conn
	 * @param statisticdate
	 * @throws Exception
	 */
	public void insertM13_net_trans_day(Connection conn) throws Exception {
		SQLExecute.exeSql(conn, func.deleteTable("M13_net_trans_day"));
		
		sql = new StringBuffer();
		sql.append(" INSERT /*+ parallel(4) append nologging */ INTO M13_NET_TRANS_DAY ");
		sql.append(" (NET_ID,TRANSACTIONKEY,PARTY_ID,ACCT_NUM,CURR_CD,PARTY_CLASS_CD,TRANS_AMT,alert_dt, ");
		sql.append(" 		ORGANKEY,OPP_ACCT_NUM,OPP_PARTY_ID,OPP_NAME,OPP_PARTY_CLASS_CD,CURRENCY_CD,USD_AMT,CNY_AMT, ");
		sql.append(" 		TX_DT,CHANNEL,RECEIVE_PAY_CD,PARTY_CHN_NAME,CASH_TRANS_FLAG,TX_GO_COUNTRY, ");
		sql.append(" 		TX_GO_AREA,TX_OCCUR_COUNTRY,TX_OCCUR_AREA,TX_CD,DT_TIME) ");
		sql.append(" SELECT T.NET_ID,N.TRANSACTIONKEY,N.PARTY_ID,N.ACCT_NUM,N.CURR_CD,N.PARTY_CLASS_CD, ");
		sql.append(" 		N.AMT TRANS_AMT,n.alert_dt, N.ORGANKEY,N.OPP_ACCT_NUM,N.OPP_PARTY_ID,N.OPP_NAME,N.OPP_PARTY_CLASS_CD, ");
		sql.append(" 		N.CURRENCY_CD,N.USD_AMT,N.CNY_AMT,N.TX_DT,N.CHANNEL,N.RECEIVE_PAY_CD,N.PARTY_CHN_NAME, ");
		sql.append(" 		N.CASH_TRANS_FLAG,N.TX_GO_COUNTRY,N.TX_GO_AREA,N.TX_OCCUR_COUNTRY,N.TX_OCCUR_AREA,N.TX_CD,N.DT_TIME  ");
		sql.append("     FROM M13_NET_ACCT_DAY T, T47_TRANSACTION_MFA_D N ");
		sql.append("    WHERE T.acct_num = N.party_id ");
		sql.append("   union ");
		sql.append(" SELECT T.NET_ID,N.TRANSACTIONKEY,N.PARTY_ID,N.ACCT_NUM,N.CURR_CD,N.PARTY_CLASS_CD, ");
		sql.append(" 		N.AMT TRANS_AMT,n.alert_dt,N.ORGANKEY,N.OPP_ACCT_NUM,N.OPP_PARTY_ID,N.OPP_NAME,N.OPP_PARTY_CLASS_CD, ");
		sql.append(" 		N.CURRENCY_CD,N.USD_AMT,N.CNY_AMT,N.TX_DT,N.CHANNEL,N.RECEIVE_PAY_CD,N.PARTY_CHN_NAME, ");
		sql.append(" 		N.CASH_TRANS_FLAG,N.TX_GO_COUNTRY,N.TX_GO_AREA,N.TX_OCCUR_COUNTRY,N.TX_OCCUR_AREA,N.TX_CD,N.DT_TIME  ");
		sql.append("     FROM M13_NET_ACCT_DAY T, T47_TRANSACTION_MFA_D N ");
		sql.append("    WHERE T.acct_num = N.OPP_party_id ");
		sql.append("   UNION ");
		sql.append(" SELECT T.NET_ID,N.TRANSACTIONKEY,N.PARTY_ID,N.ACCT_NUM,N.CURR_CD,N.PARTY_CLASS_CD, ");
		sql.append(" 		N.TRANS_AMT,n.alert_dt,N.ORGANKEY,N.OPP_ACCT_NUM,N.OPP_PARTY_ID,N.OPP_NAME,N.OPP_PARTY_CLASS_CD, ");
		sql.append(" 		N.CURRENCY_CD,N.USD_AMT,N.CNY_AMT,N.TX_DT,N.CHANNEL,N.RECEIVE_PAY_CD,N.PARTY_CHN_NAME, ");
		sql.append(" 		N.CASH_TRANS_FLAG,N.TX_GO_COUNTRY,N.TX_GO_AREA,N.TX_OCCUR_COUNTRY,N.TX_OCCUR_AREA,N.TX_CD,N.DT_TIME  ");
		sql.append("     FROM M13_NET_ACCT_DAY T, M13_NET_TRANS_KEEP N ");
		sql.append("    WHERE T.acct_num = N.party_id ");
		sql.append("   UNION ");
		sql.append(" SELECT T.NET_ID,N.TRANSACTIONKEY,N.PARTY_ID,N.ACCT_NUM,N.CURR_CD,N.PARTY_CLASS_CD, ");
		sql.append(" 		N.TRANS_AMT,n.alert_dt,N.ORGANKEY,N.OPP_ACCT_NUM,N.OPP_PARTY_ID,N.OPP_NAME,N.OPP_PARTY_CLASS_CD, ");
		sql.append(" 		N.CURRENCY_CD,N.USD_AMT,N.CNY_AMT,N.TX_DT,N.CHANNEL,N.RECEIVE_PAY_CD,N.PARTY_CHN_NAME, ");
		sql.append(" 		N.CASH_TRANS_FLAG,N.TX_GO_COUNTRY,N.TX_GO_AREA,N.TX_OCCUR_COUNTRY,N.TX_OCCUR_AREA ,N.TX_CD,N.DT_TIME ");
		sql.append("     FROM M13_NET_ACCT_DAY T, M13_NET_TRANS_KEEP N ");
		sql.append("    WHERE T.acct_num = N.OPP_party_id ");

		SQLExecute.exeSql(conn, sql.toString());
	}

	public String getParam(Connection conn) throws Exception {
		String paramcd = Constants.MFA_DT;
		String paramval = "";
		// 获取
		String sql = "SELECT * FROM T01_FUNCTION_PARAM where paramcd = '" + paramcd + "'";
		ArrayList paramList = SQLExecute.executeQuery(conn, sql, null, new T01_function_param());
		for (Iterator iter = paramList.iterator(); iter.hasNext();) {
			T01_function_param t01_function_param = (T01_function_param) iter.next();
			paramval = t01_function_param.getParamval();
		}

		return paramval;
	}

	public void insertT27_alert_party_temp_new(Connection conn, String statisticdate) throws Exception {
		func.deleteTable(conn, "T27_ALERT_PARTY_TEMP");

		DateUtils du = new DateUtils();
		int paramval = 0;
		if (!"".equals(getParam(conn))) {
			paramval = Integer.valueOf(getParam(conn));
		}
		else {
			throw new Exception("取出T01_FUNCTION_PARAM表参数不正确，请检查！！");
		}

		String date_start = du.getDateChangeALL(statisticdate, "d", paramval);

		StringBuffer sql = new StringBuffer();
		sql.append(" INSERT INTO T27_ALERT_PARTY_TEMP  (PBCKEY, PARTY_ID, ALERT_TYPE) ");
		sql.append("   SELECT DISTINCT B.PBCKEY,A.PARTY_ID,'2' ");
		sql.append("    FROM T27_ALERT_PARTY A ,T27_ALERT B ");
		sql.append("    WHERE A.ALERTKEY=B.ALERTKEY ");
		sql.append("    AND B.ALERT_STATUS_CD <> '0'  ");
		sql.append("    AND B.ALERTTYPE       =  '2' ");
		sql.append("    AND B.PBCKEY IN(SELECT PBCKEY FROM T21_PBCRULE   WHERE MODULEFLAG='1' AND PBCTYPE='1') ");
		sql.append("    AND B.ALERT_DT > to_date('" + date_start + "','yyyy-mm-dd') ");
		sql.append("    AND B.ALERT_DT <= to_date('" + statisticdate + "','yyyy-mm-dd') ");
		SQLExecute.exeSql(conn, sql.toString());
	}
}
