/*
 * $Id: TextareaTagCEB.java,v 1.9 2008/11/11 09:31:57 sj Exp $ 
 *
 * Copyright 1999-2005 The Apache Software Foundation.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.apache.struts.taglib.html;

import javax.servlet.jsp.JspException;

import org.apache.struts.taglib.TagUtils;

/**
 * Custom tag for input fields of type "textarea".
 *
 * @version $Rev: 164530 $ $Date: 2008/11/11 09:31:57 $
 */
public class TextareaTagCEB extends BaseInputTag {


    // ----------------------------------------------------- Constructor

    public TextareaTagCEB () {
        super();
        doReadonly = true;
    }

    // --------------------------------------------------------- Public Methods


    /**
     * Generate the required input tag.
     * Support for indexed since Struts 1.1
     *
     * @exception JspException if a JSP exception has occurred
     */
    public int doStartTag() throws JspException {
        
        TagUtils.getInstance().write(pageContext, this.renderTextareaElement());

        return (EVAL_BODY_TAG);
    }

    /**
     * Generate an HTML &lt;textarea&gt; tag.
     * @throws JspException
     * @since Struts 1.1
     */
    protected String renderTextareaElement() throws JspException {
        StringBuffer results = new StringBuffer("<textarea");
        
        prepareAttribute(results, "name", prepareName());
        prepareAttribute(results, "accesskey", getAccesskey());
        prepareAttribute(results, "tabindex", getTabindex());
        prepareAttribute(results, "maxlength", getMaxlength());
        prepareAttribute(results, "minlength", getMinlength());           
        prepareAttribute(results, "cols", getCols());
        prepareAttribute(results, "rows", getRows());
        prepareAttribute(results, "warning", getWarning());
        prepareAttribute(results, "checkfunc", getCheckfunc());                    
        results.append(prepareEventHandlers());
        results.append(prepareStyles());
        prepareOtherAttributes(results);
        String sname = prepareName();
        String sidname = sname+"_length";
        results.append(" onKeyUp=\"javascript:{var value="
                +"document.getElementById('"+sname+"').value; "
                +" if  (document.getElementById('"+sname+"').readOnly ==false) {"
                +" var length = 0;"
                +" for (i = 0; i < value.length; i++) {"
                +"   length += (value.charAt(i) > \'~\')?2:1; }"                
                +" document.getElementById('"+sidname+"').innerText=Math.floor((length+1)/2); }}\" "
                +" onfocusout=\"javascript:{ "
                +"  document.getElementById('"+sidname+"').innerText='';}\" "
                +" onfocus=\"javascript:{ var value="
                +"document.getElementById('"+sname+"').value; "
                +" if  (document.getElementById('"+sname+"').readOnly ==false) {"                
                +" var length = 0;"
                +" for (i = 0; i < value.length; i++) {"
                +"   length += (value.charAt(i) > \'~\')?2:1; }"   
                +" if (length!=0){"
                +" document.getElementById('"+sidname+"').innerText=Math.floor((length+1)/2);} } }\" "              
        );
        results.append(">");
        
        results.append(this.renderData());
        
        results.append("</textarea>");        
        results.append("<I id='"+sidname+"'></I>");
        //results.append("<input type='text' readOnly id='"+sidname+"' size='4'>");
        
        return results.toString();
    }

    /**
     * Renders the value displayed in the &lt;textarea&gt; tag.
     * @throws JspException
     * @since Struts 1.1
     */
    protected String renderData() throws JspException {
        String data = this.value;

        if (data == null) {
            data = this.lookupProperty(this.name, this.property);
        }
        
        return (data == null) ? "" : TagUtils.getInstance().filter(data);
    }

    /**
     * Release any acquired resources.
     */
    public void release() {

        super.release();
        name = Constants.BEAN_KEY;

    }

}
