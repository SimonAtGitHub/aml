
<%
            com.ist.common.AuthBean authBean = (com.ist.common.AuthBean) session.getAttribute("authBean");
            com.ist.common.Authorization auth = authBean.getAuthToken(); 
            //String style = auth.getT00_user().getShowstyle();
            String style = (String)session.getAttribute("style");
            %>

