/*
 * $Id: ButtonTag.java 471754 2006-11-06 14:55:09Z husted $
 *
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
package org.apache.struts.taglib.html;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;

import org.apache.struts.taglib.TagUtils;


/**
 * Renders an HTML BUTTON tag within the Struts framework.
 *
 * @version $Rev: 471754 $ $Date: 2004-10-17 02:40:12 -0400 (Sun, 17 Oct 2004)
 *          $
 */
public class TreeButtonTag extends SubmitTag {
    
    protected String treeType = null;
    
    protected String showField = null;
    
    protected String condition = null;
    
    
  


    /**
     * @return the treeType
     */
    public String getTreeType() {
        return treeType;
    }

    /**
     * @param treeType the treeType to set
     */
    public void setTreeType(String treeType) {
        this.treeType = treeType;
    }

    /**
     * @return the condition
     */
    public String getCondition() {
        return condition;
    }

    /**
     * @param condition the condition to set
     */
    public void setCondition(String condition) {
        this.condition = condition;
    }

    /**
     * @return the showField
     */
    public String getShowField() {
        return showField;
    }

    /**
     * @param showField the showField to set
     */
    public void setShowField(String showField) {
        this.showField = showField;
    }

    /**
     * Process the end of this tag. <p> Support for Indexed property since
     * Struts 1.1
     *
     * @throws JspException if a JSP exception has occurred
     */
    public int doEndTag() throws JspException {
        // Generate an HTML element
        StringBuffer results = new StringBuffer();

        results.append(getElementOpen());
        prepareAttribute(results, "name", prepareName());
        prepareButtonAttributes(results);
        results.append(prepareEventHandlers());
        results.append(prepareStyles());
        prepareOtherAttributes(results);        
        
        results.append(" onClick =\"javascript:locate_tree_amd_userorg('")
               .append(  ((HttpServletRequest)pageContext.getRequest()).getContextPath())
               .append("', '").append(this.getTreeType()).append("', '")
               .append(this.getShowField()).append("', '")
               .append(getParseCondition()).append("' ")
               .append(") \" ");   
        
        
                        
        results.append(getElementClose());

        TagUtils.getInstance().write(pageContext, results.toString());

        return (EVAL_PAGE);
    }
    
    /**
     * Render the opening element.
     *
     * @return The opening part of the element.
     */
    protected String getParseCondition() {
        //StringBuffer sb = new StringBuffer();
        //String[] cond = org.apache.commons.lang.StringUtils.split(this.getCondition(),",");        
        //sb.append(" username =\\'").append(cond[0]).append("\\' and y.dptmid=\\'").append(cond[1]).append("\\'");               
        //return sb.toString();
        return this.getCondition();
    }    

    
    /**
     * Render the opening element.
     *
     * @return The opening part of the element.
     */
    protected String getElementOpen() {
        return "<input type=\"button\"";
    }      
    
    
    /**
     * Return the default value.
     *
     * @return The default value if none supplied.
     */
    protected String getDefaultValue() {
        
        String defaultValue = "";
        if ("radio".equalsIgnoreCase(this.getTreeType())){
            defaultValue="单 选";
        }else{
            defaultValue="多 选";            
        }
        return defaultValue;
        
        //return "Click";
    }
}
