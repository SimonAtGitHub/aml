package com.ist.aml.report.bo;

import java.util.List;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

/**
 * 反洗钱上报，生成案例的xml文档
 * <p>
 * Title: INFO SENCE AUDIT SYSTEM
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2003 - 2006
 * </p>
 * <p>
 * Company: 北京银丰新融科技开发有限公司
 * </p>
 * 
 * @author 研发组
 * @version 1.0
 */
public class ReadXmlBO {
	// 下列属性的值从system_config.xml文件中取
	//String reportxmlns = "";

	//String reportxmlnsxsi = "";

	//String feedbackStorepath = "";

	//String version = "";

	//XmlReader xmlReader = null;

	public ReadXmlBO() {
		// 由配置文件获得xml上报信息
		// 由配置文件获得xml上报信息
		//xmlReader = new XmlReader();
		/*reportxmlns = xmlReader
				.getProperty("business_config.reportXML.reportxmlns");*/
		/*reportxmlnsxsi = xmlReader
				.getProperty("business_config.reportXML.reportxmlnsxsi");*/
		/*feedbackStorepath = xmlReader
				.getProperty("business_config.reportXML.feedbackStorepath");*/
		/*version = xmlReader.getProperty("business_config.reportXML.version");*/

	}

	// 根据文件名，读取回执文件中的数据
	public String readFeedbackBOTest(String xmlFileName) throws Exception {
		SAXBuilder builder = new SAXBuilder();
		Document read_doc = builder.build(xmlFileName);
		Element FDBK = read_doc.getRootElement();

		Element SFID = FDBK.getChild("SFID");
		Element FSNM = FDBK.getChild("FSNM");
		System.out.println(SFID.getName() + ":" + SFID.getText());
		System.out.println(FSNM.getName() + ":" + FSNM.getText());

		return "";
	}

	// 根据文件名，读取回执文件中的数据
	public String readFeedbackBO(String xmlFileName) throws Exception {

		String totel = "+++++++++++";
		//建立解析器，准备对xml文件进行解析
		SAXBuilder builder = new SAXBuilder();
		Document read_doc = builder.build(xmlFileName);
		Element stu = read_doc.getRootElement();

		// 得到文件名的起始位置
		int lateIndex = xmlFileName.lastIndexOf("/");

		// 根据回执文件名得到回执类型和回执对应的数据包名
		String feedbackType = xmlFileName.substring(lateIndex + 1,
				lateIndex + 5);
		/*		String packetName = xmlFileName.substring(lateIndex + 5);
		*/

		//回执文件的根节点
		List list1 = stu.getChildren();
		Element FDBKElement = (Element) list1.get(0);
		System.out.println(FDBKElement.getName() + ":" + FDBKElement.getText());
		List FDBKChildlist = FDBKElement.getChildren();

		//根据不同的回执文件类型而进行不同的解析
		if (feedbackType.equalsIgnoreCase("FDSC")) { // 解析正确发送的回执文件		
			//发送正确或错误标识
			Element SFIDElement = (Element) FDBKChildlist.get(0);
			/*			String SFID = SFIDElement.getText();*/
			System.out.println(SFIDElement.getName() + ":"
					+ SFIDElement.getText());

			//成功发送的文件数
			Element FSNMElement = (Element) FDBKChildlist.get(1);
			System.out.println(FSNMElement.getName() + ""
					+ FSNMElement.getText());

		} else if (feedbackType.equalsIgnoreCase("FDNF")) {// 解析文件名错误的回执文件			
			//发送正确或错误标识
			Element SFIDElement = (Element) FDBKChildlist.get(0);
			System.out.println(SFIDElement.getName() + ":"
					+ SFIDElement.getText());

			//错误总数
			Element ERTNElement = (Element) FDBKChildlist.get(1);
			System.out.println(ERTNElement.getName() + ":"
					+ ERTNElement.getText());

			//文件名称错误总数
			Element NMERsElement = (Element) FDBKChildlist.get(2);
			System.out.println(NMERsElement.getName() + ":"
					+ NMERsElement.getText());

			//文件名称错误信息			
			List NMERList = NMERsElement.getChildren();
			for (int i = 0; i < NMERList.size(); i++) //循环定位每个错误文件信息
			{
				Element NMERElement = (Element) NMERList.get(i);

				//错误文件序号
				String NMERSeq = NMERElement.getAttributeValue("seqno");
				System.out.println("错误文件序号:" + NMERSeq);

				//错误文件名称
				List NMERChildList = NMERElement.getChildren();
				Element EFNMElement = (Element) NMERChildList.get(0);
				System.out.println(EFNMElement.getName() + ":"
						+ EFNMElement.getText());

				//错误原因
				Element ERRSElement = (Element) NMERChildList.get(1);
				System.out.println(ERRSElement.getName() + ":"
						+ ERRSElement.getText());

			}

		} else if (feedbackType.equalsIgnoreCase("FDCF")) {// 解析文件内容错误的回执文件
			//发送正确或错误标识
			Element SFIDElement = (Element) FDBKChildlist.get(0);
			System.out.println(SFIDElement.getName() + ":"
					+ SFIDElement.getText());

			//错误总数
			Element EFTNElement = (Element) FDBKChildlist.get(1);
			System.out.println(EFTNElement.getName() + ":"
					+ EFTNElement.getText());

			//错误文件总数
			Element ERFLsElement = (Element) FDBKChildlist.get(2);
			System.out.println(ERFLsElement.getName() + ":"
					+ ERFLsElement.getText());

			//文件名称错误信息			
			List ERFLList = ERFLsElement.getChildren();
			for (int i = 0; i < ERFLList.size(); i++) //循环定位每个错误文件信息
			{
				Element ERFLElement = (Element) ERFLList.get(i);

				//错误文件序号
				String ERFLSeq = ERFLElement.getAttributeValue("seqno");
				System.out.println("错误文件序号:" + ERFLSeq);

				List ERFLChildList = ERFLElement.getChildren();

				//错误文件名称
				Element EFNMElement = (Element) ERFLChildList.get(0);
				System.out.println(EFNMElement.getName() + ":"
						+ EFNMElement.getText());

				//该文件错误总数
				Element ERTNElement = (Element) ERFLChildList.get(1);
				System.out.println(ERTNElement.getName() + ":"
						+ ERTNElement.getText());

				//文件内容错误总数
				Element FCERsList = (Element) ERFLChildList.get(2);
				System.out.println(FCERsList.getName() + ":"
						+ FCERsList.getText());

				List FCERList = FCERsList.getChildren();
				for (int j = 0; j < FCERList.size(); j++) //循环定位该文件中每个错误信息
				{
					Element FCERElement = (Element) FCERList.get(j);

					//该文件中错误内容序号
					String FCERSeq = FCERElement.getAttributeValue("seqno");
					System.out.println("错误文件序号:" + FCERSeq);

					List FCERChildList = FCERElement.getChildren();
					//错误定位
					Element ERLCElement = (Element) FCERChildList.get(0);
					System.out.println(ERLCElement.getName() + ":"
							+ ERLCElement.getText());

					//错误原因
					Element ERRSElement = (Element) FCERChildList.get(1);
					System.out.println(ERRSElement.getName() + ":"
							+ ERRSElement.getText());
				}
			}
		} else {
			//输出其他类型的回执或者错误处理
		}
		return totel;
	}

	public static void main(String args[]) throws Exception {
		ReadXmlBO readXmlBO = new ReadXmlBO();
		readXmlBO
				.readFeedbackBOTest("D:/report/feedbackXML/20070322/FDSCNBH999999999999999-20070411-0002.xml");
	}
}
